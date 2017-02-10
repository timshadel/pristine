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


struct TimeChanged: Event {

    let now: Date

    init(to now: Date) {
        self.now = now
    }

}
