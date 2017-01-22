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
import SwiftyBeaver


struct LoggingMiddleware: Middleware {

    /// Log all events based on their type
    func process(event: Event, state: State) {
        switch event {
        case _ as SeriousErrorEvent:
            log.error("event=\(event)")
        case _ as MinorErrorEvent:
            log.warning("event=\(event)")
        case _ as NotableEvent:
            log.info("event=\(event)")
        default:
            log.verbose("event=\(event)")
        }
    }

}
