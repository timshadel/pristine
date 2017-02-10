//
//  Main.swift
//  pristine
//
//  Created by Tim on 1/21/17.
//  Copyright © 2017 Day Logger, Inc. All rights reserved.
//

import Foundation
import Reactor
import UIKit


final class Main: UIViewController {

    var core = App.sharedCore

    @IBOutlet weak var middleLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!

    @IBOutlet weak var middleRight: UILabel!
    @IBOutlet weak var bottomRight: UILabel!
    
    override func viewDidLoad() {
        let color = UIColor(hex: 0x707679)
        let pointSize: CGFloat = 14.0

        let smallCapsFont = UIFont(name: "ProximaNova-Semibold", size: pointSize)!
        let font = UIFont(name: "ProximaNova-Semibold", size: 12.0)!

        middleLabel.font = font
        middleLabel.text = "MY CAPTION"
        middleLabel.textColor = color
        bottomRight.font = font
        bottomRight.text = "MY CAPTION"
        bottomRight.textColor = color

        middleRight.text = "MY CAPTION"
        middleRight.textColor = color
        bottomLabel.text = "My Caption"
        bottomLabel.textColor = color

        middleLabel.backgroundColor = UIColor.green
        middleRight.backgroundColor = UIColor.green

        let systemFontDesc = smallCapsFont.fontDescriptor
        //.systemFont(ofSize: pointSize, weight: UIFontWeightLight).fontDescriptor
        let smallCapsFontDesc = systemFontDesc.addingAttributes([
            UIFontDescriptorFeatureSettingsAttribute: [
                [
                    UIFontFeatureTypeIdentifierKey: kLowerCaseType,
                    UIFontFeatureSelectorIdentifierKey: kLowerCaseSmallCapsSelector,
                    ],
                [
                    UIFontFeatureTypeIdentifierKey: kUpperCaseType,
                    UIFontFeatureSelectorIdentifierKey: kUpperCaseSmallCapsSelector,
                    ],
            ]
        ])

        middleRight.font = font // UIFont(descriptor: smallCapsFontDesc, size: pointSize)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.2
        let text = middleRight.text!
        let attributed = NSMutableAttributedString(string: text, attributes: [NSParagraphStyleAttributeName: paragraphStyle, NSFontAttributeName: font])
        attributed.setAttributes([NSKernAttributeName: 5.0], range: NSRange(location: 0, length: text.characters.count-1))
        middleRight.attributedText = attributed
        bottomLabel.font = UIFont(descriptor: smallCapsFontDesc, size: pointSize)
    }

}


public extension UIColor {

    convenience public init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex >> 16) & 0xFF)/255.0
        let green = CGFloat((hex >> 8) & 0xFF)/255.0
        let blue = CGFloat((hex) & 0xFF)/255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

}
