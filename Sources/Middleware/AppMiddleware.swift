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
import Reactor


struct AppMiddleware {

    /// All middlewares used by the app
    static var allMiddleware: [AnyMiddleware] = [ logging ]

    /// Shared instance of logging middleware
    static var logging = LoggingMiddleware()

}
