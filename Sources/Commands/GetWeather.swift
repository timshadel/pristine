//      \/[]\/
//        /\
//       |  |  +----+
//       |  |  |    |
//       |  |  `----'
//       |  |
//       |  |
//        \/
//

import Foundation
import Marshal
import PromiseKit
import PMKAlamofire
import Reactor


struct Weather: Unmarshaling {
    let temperature: Measurement<UnitTemperature>

    init(object: MarshaledObject) throws {
        self.temperature = Measurement(k: try object.value(for: "main.temp")).converted(to: .fahrenheit)
    }

}

extension Measurement where UnitType: UnitTemperature {

    init(k: Double) {
        self.init(value: k, unit: UnitType.kelvin as! UnitType)
    }

    init(f: Double) {
        self.init(value: f, unit: UnitType.fahrenheit as! UnitType)
    }

    init(c: Double) {
        self.init(value: c, unit: UnitType.celsius as! UnitType)
    }

}

struct GetWeather: Command {

    func execute(state: AppState, core: Core<AppState>) {
        firstly { _ -> Promise<JSONObject> in
            core.fire(event: Request<Weather>.sent(at: Date()))
            return Alamofire.request("http://api.openweathermap.org/data/2.5/weather?lat=40.5622&lon=-111.9297&APPID=576d73dc6d4c22954937d4e203cc66fb", method: .get)
                .validate(statusCode: 200..<300)
                .validate(contentType: ["application/json"])
                .responseJsonDictionary()
        }.then { json in
            core.fire(event: Request<Weather>.result(try Weather(object: json)))
        }.catch { error in
            core.fire(event: Request<Weather>.error(error))
        }
    }

}
