//      \/[]\/
//        /\
//       |  |  +----+
//       |  |  |    |
//       |  |  `----'
//       |  |
//       |  |
//        \/
//

import UIKit


public extension UIFont {

    convenience init(style: AppFont, size: CGFloat = 17.0) {
        self.init(name: style.rawValue, size: size)!
    }

    enum AppFont: String {
        case regular = "ProximaNova-Regular"
        case italic = "ProximaNova-RegularIt"
        case light = "ProximaNova-Light"
        case semibold = "ProximaNova-Semibold"
        case code = "Courier"
    }

    static var navTitle: UIFont {
        return h3
    }

    static var barButtonItem: UIFont {
        return h6
    }

    // appFont.regular
    static var body: UIFont {
        return UIFont(style: .regular)
    }

    // appFont.regular.italic
    static var bodyItalic: UIFont {
        return UIFont(style: .italic)
    }

    // appFont.light
    static var bodyLight: UIFont {
        return UIFont(style: .light)
    }

    // appFont.regular.smaller
    static var smallBody: UIFont {
        return UIFont(style: .regular, size: 14)
    }

    static var sectionHeader: UIFont {
        return formHeading
    }

    // appFont.regular.tiny
    static var tabBarItem: UIFont {
        return UIFont(style: .regular, size: 10)
    }

    // appFont.regular.huge
    static var h1: UIFont {
        return UIFont(style: .regular, size: 28)
    }

    // appFont.regular.big
    static var h2: UIFont {
        return UIFont(style: .regular, size: 22)
    }

    // appFont.regular.
    static var h3: UIFont {
        return UIFont(style: .semibold, size: 20)
    }

    static var h4: UIFont {
        return UIFont(style: .regular, size: 20)
    }

    static var h5: UIFont {
        return UIFont(style: .semibold, size: 16)
    }

    static var h6: UIFont {
        return UIFont(style: .regular, size: 16)
    }

    static var formHeading: UIFont {
        return UIFont(style: .semibold, size: 14).smallCaps
    }

    static var formSubHeading: UIFont {
        return UIFont(style: .regular, size: 12)
    }

    static var textLink: UIFont {
        return h5
    }

    static var code: UIFont {
        return UIFont(style: .code, size: 14)
    }

    static func regularAppFont(ofSize size: Int) -> UIFont {
        return UIFont(style: .regular, size: CGFloat(size))
    }

    static func semiBoldAppFont(ofSize size: Int) -> UIFont {
        return UIFont(style: .semibold, size: CGFloat(size))
    }

}


extension UITraitCollection {

    var fonts: TraitFonts { return TraitFonts(contentSize: preferredContentSizeCategory) }

}

struct AppFont {

    enum Style {
        case normal
        case italic
        case mono
    }

    enum Weight: Int {
        case ultraLight = 100
        case thin = 200
        case light = 300
        case regular = 400
        case medium = 500
        case semibold = 600
        case bold = 700
        case heavy = 800
        case black = 900
    }

    var name: String {
        switch (style, weight) {
        case (.normal, .ultraLight), (.normal, .thin), (.normal, .light):
            return "ProximaNova-Light"
        case (.normal, .regular), (.normal, .medium):
            return "ProximaNova-Regular"
        case (.normal, .semibold), (.normal, .bold), (.normal, .heavy), (.normal, .black):
            return "ProximaNova-Semibold"
        case (.italic, _):
            return "ProximaNova-RegularIt"
        case (.mono, _):
            return "Courier"
        default:
            return ""
        }
    }

    static let baseFontSize: CGFloat = 17.0

    let style: Style
    let weight: Weight
    let size: CGFloat

    init(style: Style = .normal, weight: Weight = .regular, size: CGFloat = AppFont.baseFontSize) {
        self.style = style
        self.weight = weight
        self.size = size
    }

    var italic: AppFont {
        return AppFont(style: .italic, weight: weight, size: size)
    }

    var mono: AppFont {
        return AppFont(style: .mono, weight: weight, size: size)
    }

    var light: AppFont {
        return AppFont(style: style, weight: .light, size: size)
    }

    var bold: AppFont {
        return AppFont(style: style, weight: .bold, size: size)
    }

    var semibold: AppFont {
        return AppFont(style: style, weight: .semibold, size: size)
    }

    func size(_ fontSize: CGFloat) -> AppFont {
        return AppFont(style: style, weight: weight, size: fontSize)
    }

    func plus(_ sizeDelta: CGFloat) -> AppFont {
        return size(AppFont.baseFontSize + sizeDelta)
    }

    func font(in contentSize: UIContentSizeCategory = UIContentSizeCategory.large) -> UIFont {
        var fontSize = size
        switch contentSize {
        case UIContentSizeCategory.accessibilityExtraExtraExtraLarge:
            fontSize += 6
        case UIContentSizeCategory.accessibilityExtraExtraLarge:
            fontSize += 5
        case UIContentSizeCategory.accessibilityExtraLarge, UIContentSizeCategory.accessibilityLarge:
            fontSize += 4
        case UIContentSizeCategory.accessibilityMedium, UIContentSizeCategory.extraExtraExtraLarge:
            fontSize += 3
        case UIContentSizeCategory.extraExtraLarge:
            fontSize += 2
        case UIContentSizeCategory.extraLarge:
            fontSize += 1
        case UIContentSizeCategory.large:
            break
        case UIContentSizeCategory.medium:
            fontSize += -1
        case UIContentSizeCategory.small:
            fontSize += -2
        case UIContentSizeCategory.extraSmall:
            fontSize += -3
        default:
            break
        }

        return UIFont(name: name, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }

}


struct FontSet {

    let navTitle: UIFont
    let barButtonItem: UIFont
    let tabBarItem: UIFont
    let h1: UIFont
    let h2: UIFont
    let h3: UIFont
    let h4: UIFont
    let h5: UIFont
    let h6: UIFont
    let sectionHeader: UIFont
    let formHeading: UIFont
    let formSubHeading: UIFont
    let body: UIFont
    let bodyItalic: UIFont
    let bodyLight: UIFont
    let bodyStrong: UIFont
    let bodySmall: UIFont
    let textLink: UIFont
    let code: UIFont

    init(contentSize: UIContentSizeCategory, baseSize: CGFloat = AppFont.baseFontSize) {
        self.tabBarItem     = AppFont(size: 10.0).font(in: contentSize)

        let baseFont        = AppFont(size: baseSize)
        self.navTitle       = baseFont.font(in: contentSize)
        self.barButtonItem  = baseFont.font(in: contentSize)
        self.h1             = baseFont.plus(11.0).font(in: contentSize)
        self.h2             = baseFont.plus(5.0).font(in: contentSize)
        self.h3             = baseFont.semibold.plus(3.0).font(in: contentSize)
        self.h4             = baseFont.plus(3.0).font(in: contentSize)
        self.h5             = baseFont.semibold.plus(-1.0).font(in: contentSize)
        self.h6             = baseFont.plus(-1.0).font(in: contentSize)
        self.formHeading    = baseFont.semibold.plus(-3.0).font(in: contentSize).smallCaps
        self.formSubHeading = baseFont.plus(-4.0).font(in: contentSize)
        self.sectionHeader  = baseFont.semibold.plus(-4.0).font(in: contentSize)

        let bodyFont        = baseFont
        self.body           = bodyFont.font(in: contentSize)
        self.bodyItalic     = bodyFont.italic.font(in: contentSize)
        self.bodyLight      = bodyFont.light.font(in: contentSize)
        self.bodyStrong     = bodyFont.bold.font(in: contentSize)
        self.bodySmall      = bodyFont.plus(-3.0).font(in: contentSize)

        self.textLink       = baseFont.semibold.plus(-1.0).font(in: contentSize)
        self.code           = baseFont.mono.plus(-3.0).font(in: contentSize)
    }

}


struct TraitFonts {

    let contentSize: UIContentSizeCategory

    var navTitle: UIFont {
        return h3
    }

    var barButtonItem: UIFont {
        return h6
    }

    // appFont.regular
    var body: UIFont {
        return UIFont(style: .regular)
    }

    // appFont.regular.italic
    var bodyItalic: UIFont {
        return UIFont(style: .italic)
    }

    // appFont.light
    var bodyLight: UIFont {
        return UIFont(style: .light)
    }

    // appFont.regular.smaller
    var smallBody: UIFont {
        return UIFont(style: .regular, size: 14)
    }

    var sectionHeader: UIFont {
        return formHeading
    }

    // appFont.regular.tiny
    var tabBarItem: UIFont {
        return UIFont(style: .regular, size: 10)
    }

    // appFont.regular.huge
    var h1: UIFont {
        return UIFont(style: .regular, size: 28)
    }

    // appFont.regular.big
    var h2: UIFont {
        return UIFont(style: .regular, size: 22)
    }

    // appFont.regular.
    var h3: UIFont {
        return UIFont(style: .semibold, size: 20)
    }

    var h4: UIFont {
        return UIFont(style: .regular, size: 20)
    }

    var h5: UIFont {
        return UIFont(style: .semibold, size: 16)
    }

    var h6: UIFont {
        return UIFont(style: .regular, size: 16)
    }

    var formHeading: UIFont {
        return UIFont(style: .semibold, size: 14).smallCaps
    }

    var formSubHeading: UIFont {
        return UIFont(style: .regular, size: 12)
    }

    var textLink: UIFont {
        return h5
    }

    var code: UIFont {
        return UIFont(style: .code, size: 14)
    }

    func regularAppFont(ofSize size: Int) -> UIFont {
        return UIFont(style: .regular, size: CGFloat(size))
    }

    func semiBoldAppFont(ofSize size: Int) -> UIFont {
        return UIFont(style: .semibold, size: CGFloat(size))
    }
}



protocol AppTypography {

    // MARK: - Navigation

    var navTitle: UIFont { get }
    var barButtonItem: UIFont { get }
    var tabBarItem: UIFont { get }


    // MARK: - Headings

    var h1: UIFont { get }
    var h2: UIFont { get }
    var h3: UIFont { get }
    var h4: UIFont { get }
    var h5: UIFont { get }
    var h6: UIFont { get }
    
    
    // MARK: - Subheadings

    var sectionHeader: UIFont { get }
    var formHeading: UIFont { get }
    var formSubHeading: UIFont { get }


    // MARK: - Body content

    var body: UIFont { get }
    var bodyItalic: UIFont { get }
    var bodyStrong: UIFont { get }
    var bodyLight: UIFont { get }
    var bodySmall: UIFont { get }
    var textLink: UIFont { get }
    var code: UIFont { get }

}


extension UIFont {



}


extension AppTypography {

    var navTitle: UIFont {
        return h3
    }

    var barButtonItem: UIFont {
        return h6
    }

    var sectionHeader: UIFont {
        return formHeading
    }

    var textLink: UIFont {
        return h5
    }

}



// MARK: - HEX init

enum UIColorInputError: Error {
    case unableToScanHexValue
    case typeMismatch
}

extension UIColor {

    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex >> 16) & 0xFF)/255.0
        let green = CGFloat((hex >> 8) & 0xFF)/255.0
        let blue = CGFloat((hex) & 0xFF)/255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

    convenience init(hexString: String, alpha: CGFloat = 1.0) throws {
        var hexValue: UInt32 = 0
        guard Scanner(string: hexString).scanHexInt32(&hexValue) else {
            self.init() // Must init or we get EXEC_BAD_ACCESS
            throw UIColorInputError.unableToScanHexValue
        }
        self.init(hex: Int(hexValue), alpha: alpha)
    }

    var hexString: String {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        red = CGFloat(roundf(Float(red) * 255.0))
        green = CGFloat(roundf(Float(green) * 255.0))
        blue = CGFloat(roundf(Float(blue) * 255.0))
        alpha = CGFloat(roundf(Float(alpha) * 255.0))

        // Ignore alpha for now
        let hex: UInt = (UInt(red) << 16) | (UInt(green) << 8) | (UInt(blue))
        return String(format: "%06x", hex)
    }

    // From http://stackoverflow.com/a/35950131
    func lightened(by amount: CGFloat = 0.8) -> UIColor {
        return mix(with: .white, amount: amount)
    }

    func darkened(by amount: CGFloat = 0.8) -> UIColor {
        return mix(with: .black, amount: amount)
    }

    func mix(with color: UIColor, amount: CGFloat = 0.25) -> UIColor {
        var r1     : CGFloat = 0
        var g1     : CGFloat = 0
        var b1     : CGFloat = 0
        var alpha1 : CGFloat = 0
        var r2     : CGFloat = 0
        var g2     : CGFloat = 0
        var b2     : CGFloat = 0
        var alpha2 : CGFloat = 0

        self.getRed (&r1, green: &g1, blue: &b1, alpha: &alpha1)
        color.getRed(&r2, green: &g2, blue: &b2, alpha: &alpha2)
        return UIColor( red:r1*(1.0-amount)+r2*amount,
                        green:g1*(1.0-amount)+g2*amount,
                        blue:b1*(1.0-amount)+b2*amount,
                        alpha: alpha1 )
    }

}
