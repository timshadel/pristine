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


/// Simple state machine for tracking any request for a value of some kind.
enum Request<Value>: State, Event {

    case ready
    case sent(at: Date)
    case result(Value)
    case error(Error)
    case canceled

    mutating func react(to event: Event) {
        guard let newState = event as? Request<Value> else { return }

        switch (self, newState) {
        case (_, .ready),
             (.ready, .sent),
             (.sent, .result),
             (.sent, .error),
             (.sent, .canceled):
            transition(to: newState)
        default:
            break
        }
    }

    private mutating func transition(to newState: Request) {
        self = newState
    }
    
}
