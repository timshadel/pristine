//      \/[]\/
//        /\
//       |  |  +----+
//       |  |  |    |
//       |  |  `----'
//       |  |
//       |  |
//        \/
//

import Reactor
import SwiftyBeaver
import UIKit


@UIApplicationMain class App: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    var window: UIWindow?


    // MARK: - Application Lifecycle

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        SwiftyBeaver.configure()
        App.sharedCore.fire(event: AppStarted())
        App.sharedCore.fire(command: GetWeather())
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 6) {
            App.sharedCore.fire(event: TimeChanged(to: Date()))
        }

        return true
    }

}


// MARK: - Reactor

extension App {

    static let sharedCore = Core(state: AppState(), middlewares: AppMiddleware.allMiddleware)

}
