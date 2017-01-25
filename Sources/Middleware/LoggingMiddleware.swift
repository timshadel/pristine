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
        case let event as SeriousErrorEvent:
            log.error(event.keyedValues())
        case let event as MinorErrorEvent:
            log.warning(event.keyedValues())
        case let event as NotableEvent:
            log.info(event.keyedValues())
        case let event as DetailedEvent:
            log.debug(event.keyedValues())
        case let event as RecordableEvent:
            log.verbose(event.keyedValues())
        default:
            log.verbose("Unrecordable event: \(event)")
        }
    }

}
