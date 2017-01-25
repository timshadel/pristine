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


/// Event with all details about when and how the app started
struct AppStarted: NotableEvent {

    let bundleId: String

    init() {
        self.bundleId = Bundle.main.bundleIdentifier!
    }

    func jsonObject() -> JSONObject {
        return [
            Keys.AppEvents.bundleId: bundleId
        ]
    }

}


extension Keys {

    struct AppEvents {
        static let bundleId = "bundleId"
    }

}
