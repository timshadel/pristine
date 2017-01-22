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


/// Marker protocol for serious events
protocol SeriousErrorEvent: Event {
    var error: Error { get }
}


/// Marker protocol for minor events
protocol MinorErrorEvent: Event {
    var error: Error { get }
}


/// Marker protocol for interesting events
protocol NotableEvent: Event {

}
