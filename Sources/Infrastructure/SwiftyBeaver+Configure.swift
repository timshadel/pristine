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
import SwiftyBeaver

/// Handle for logging to SwiftyBeaver
let log = SwiftyBeaver.self

extension SwiftyBeaver {

    // MARK: - Private properties

    static fileprivate let console = ConsoleDestination()


    // MARK: - Internal functions

    static func configure() {
        log.addDestination(console)
    }

}
