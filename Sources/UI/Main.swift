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

        let contentSizes: [UIContentSizeCategory] = [.large, .extraLarge]
        let styles: [UIFontTextStyle] = [.body, .caption1]

        for style in styles {
            print("\n\(style.rawValue)")
            for size in contentSizes {
                let traits = UITraitCollection(preferredContentSizeCategory: size)
                let font = UIFont.preferredFont(forTextStyle: style, compatibleWith: traits)
                print("\n\(style.rawValue)\n\(font.fontName) \(font)");
            }
        }

        let gray500 = UIColor(hex: 0x868c8f)
        let gray400 = gray500.lightened(by: 0.15)
        let gray300 = gray500.lightened(by: 0.40)
        let gray200 = gray500.lightened(by: 0.55)
        let gray100 = gray500.lightened(by: 0.70)
        let gray050 = gray500.lightened(by: 0.85)

        let gray600 = gray500.darkened(by: 0.15)
        let gray700 = gray500.darkened(by: 0.30)
        let gray800 = gray500.darkened(by: 0.45)
        let gray900 = gray500.darkened(by: 0.60)

        print(" 50g: \(gray050.hexString)")
        print("100g: \(gray100.hexString)")
        print("200g: \(gray200.hexString)")
        print("300g: \(gray300.hexString)")
        print("400g: \(gray400.hexString)")
        print("500g: \(gray500.hexString)")
        print("600g: \(gray600.hexString)")
        print("700g: \(gray700.hexString)")
        print("800g: \(gray800.hexString)")
        print("900g: \(gray900.hexString)")

        let tint500 = UIColor(hex: 0xFD6020)
        let tint400 = tint500.lightened(by: 0.15)
        let tint300 = tint500.lightened(by: 0.40)
        let tint200 = tint500.lightened(by: 0.55)
        let tint100 = tint500.lightened(by: 0.70)
        let tint050 = tint500.lightened(by: 0.85)

        let tint600 = tint500.darkened(by: 0.15)
        let tint700 = tint500.darkened(by: 0.30)
        let tint800 = tint500.darkened(by: 0.45)
        let tint900 = tint500.darkened(by: 0.60)

        print(" 50 : \(tint050.hexString)")
        print("100 : \(tint100.hexString)")
        print("200 : \(tint200.hexString)")
        print("300 : \(tint300.hexString)")
        print("400 : \(tint400.hexString)")
        print("500 : \(tint500.hexString)")
        print("600 : \(tint600.hexString)")
        print("700 : \(tint700.hexString)")
        print("800 : \(tint800.hexString)")
        print("900 : \(tint900.hexString)")

        let atint500 = UIColor(hex: 0xFD6020)
        let atint400 = UIColor.white.mix(with: tint500, amount: 0.85)
        let atint300 = UIColor.white.mix(with: tint500, amount: 0.60)
        let atint200 = UIColor.white.mix(with: tint500, amount: 0.45)
        let atint100 = UIColor.white.mix(with: tint500, amount: 0.30)
        let atint050 = UIColor.white.mix(with: tint500, amount: 0.15)

        let atint600 = UIColor.black.mix(with: tint500, amount: 0.85)
        let atint700 = UIColor.black.mix(with: tint500, amount: 0.70)
        let atint800 = UIColor.black.mix(with: tint500, amount: 0.55)
        let atint900 = UIColor.black.mix(with: tint500, amount: 0.40)
        let atint950 = UIColor.black.mix(with: tint500, amount: 0.25)
        let atint980 = UIColor.black.mix(with: tint500, amount: 0.10)

        print(" 50a: \(atint050.hexString)")
        print("100a: \(atint100.hexString)")
        print("200a: \(atint200.hexString)")
        print("300a: \(atint300.hexString)")
        print("400a: \(atint400.hexString)")
        print("500a: \(atint500.hexString)")
        print("600a: \(atint600.hexString)")
        print("700a: \(atint700.hexString)")
        print("800a: \(atint800.hexString)")
        print("900a: \(atint900.hexString)")
        print("950a: \(atint950.hexString)")
        print("980a: \(atint980.hexString)")


        let thing = "<span style='font-family: \"Proxima Nova\"; font-weight: 700; font-size: 28px; line-height: 34px; font-variant: small-caps'>This is a thing.</span>"
        let data = thing.data(using: String.Encoding.utf8)!

        let attributedString = try! NSAttributedString(data: data, options:
            [ NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType,
              NSCharacterEncodingDocumentAttribute : NSNumber(value: String.Encoding.utf8.rawValue)], documentAttributes: nil)
        print(attributedString)

        let para = NSMutableParagraphStyle()
        para.minimumLineHeight = 34.0
        let other = NSAttributedString(string: "Another thing", attributes: [
            NSParagraphStyleAttributeName: para
        ])
        print(other)


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
