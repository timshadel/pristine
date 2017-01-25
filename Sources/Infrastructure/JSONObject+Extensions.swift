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


/// - Note: JSONObjects are dictionaries, so they can't be directly extended
extension Dictionary where Key: ExpressibleByStringLiteral, Value: Any {

    /// Returns a `key=value` representation of this dictionary.
    ///
    /// Keys or values with spaces in them are wrapped in double quotes, `"my key"="some long value"`.
    /// Nested dictionaries appear as dotted keys, `sub.key=subvalue`. Any objects conforming to `JSONMarshaling`
    /// are automatically turned into their JSON objects, and then into the `key=value` format.
    func keyedValues() -> String {
        return keyedValues(prefixedWith: nil).joined(separator: " ")
    }

    fileprivate func keyedValues(prefixedWith prefix: String?) -> [String] {
        var values = [String]()
        for (key, value) in self {
            let compositeKey = prefix != nil ? "\(prefix!).\(key)" : "\(key)"
            switch value {
            case let object as [String:Any]:
                values.append(contentsOf: object.keyedValues(prefixedWith: compositeKey))
            case let marshaling as JSONMarshaling:
                values.append(contentsOf: marshaling.jsonObject().keyedValues(prefixedWith: compositeKey))
            default:
                let strValue = "\(value)"
                values.append("\(sanitize(compositeKey))=\(sanitize(strValue))")
            }
        }
        return values
    }

    fileprivate func sanitize(_ string: String) -> String {
        if string.contains(" ") {
            let str = string.replacingOccurrences(of: "\\", with: "\\\\").replacingOccurrences(of: "\"", with: "\\\"")
            return "\"\(str)\""
        } else {
            return string
        }
    }

}
