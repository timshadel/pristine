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
import Reactor


/// Base protocol for making events that can be saved
protocol RecordableEvent: Event, JSONMarshaling {

}

extension RecordableEvent {

    func keyedValues() -> String {
        var detail = jsonObject()
        detail["event"] = String(describing: type(of: self))
        return detail.keyedValues()
    }
    
}
