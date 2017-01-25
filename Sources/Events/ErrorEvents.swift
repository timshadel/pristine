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


/// An event which has a significant negative impact to the user
protocol SeriousErrorEvent: RecordableEvent {
    var error: Error { get }
}


/// An event which is inconvenient, but manageable
protocol MinorErrorEvent: RecordableEvent {
    var error: Error { get }
}


/// An event which is worth knowing about in most circumstances
protocol NotableEvent: RecordableEvent {

}


/// An event which is ok to ignore unless you're looking for something specific
protocol DetailedEvent: RecordableEvent {

}
