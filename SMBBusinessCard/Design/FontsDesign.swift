//
//  FontsDesign.swift
//  SMBBusinessCard
//
//  Created by Apinun on 14/7/2566 BE.
//

import UIKit

public enum FamilyFont {
    case nunito
    case robotoCondensed
}

public enum LabeStyleGuide: LabeStyle {
    case header1
    case header2
    case header3
    case mediumLight
    case mediumBold
    case medium
    case smallLight
    case small
    case smallBold
    case `default`
    var fontSize: CGFloat {
        switch self {
        case .header1: return 25
        case .header2: return 22
        case .header3: return 18
        case .medium, .mediumBold, .mediumLight: return 16
        case .small, .smallBold, .smallLight: return 14
        default: return 16
        }
    }
    
    func customFont(familFont: FamilyFont) -> UIFont {
        switch familFont {
        case .nunito:
            switch self {
            case .header1:
                return UIFont(name: "Nunito-Bold", size: self.fontSize) ?? .systemFont(ofSize: self.fontSize)
            case .header2:
                return UIFont(name: "Nunito-SemiBold", size: self.fontSize) ?? .systemFont(ofSize: self.fontSize)
            case .header3:
                return UIFont(name: "Nunito-SemiBold", size: self.fontSize) ?? .systemFont(ofSize: self.fontSize)
            case .mediumLight:
                return UIFont(name: "Nunito-Light", size: self.fontSize) ?? .systemFont(ofSize: self.fontSize)
            case .mediumBold:
                return UIFont(name: "Nunito-Bold", size: self.fontSize) ?? .systemFont(ofSize: self.fontSize)
            case .medium:
                return UIFont(name: "Nunito-Medium", size: self.fontSize) ?? .systemFont(ofSize: self.fontSize)
            case .smallLight:
                return UIFont(name: "Nunito-Light", size: self.fontSize) ?? .systemFont(ofSize: self.fontSize)
            case .small:
                return UIFont(name: "Nunito-Medium", size: self.fontSize) ?? .systemFont(ofSize: self.fontSize)
            case .smallBold:
                return UIFont(name: "Nunito-Bold", size: self.fontSize) ?? .systemFont(ofSize: self.fontSize)
            case .default:
                return .systemFont(ofSize: self.fontSize)
            }
        case .robotoCondensed:
            switch self {
            case .header1:
                return UIFont(name: "RobotoCondensed-Bold", size: self.fontSize) ?? .systemFont(ofSize: self.fontSize)
            case .header2:
                return UIFont(name: "RobotoCondensed-Bold", size: self.fontSize) ?? .systemFont(ofSize: self.fontSize)
            case .header3:
                return UIFont(name: "RobotoCondensed-Bold", size: self.fontSize) ?? .systemFont(ofSize: self.fontSize)
            case .mediumLight:
                return UIFont(name: "RobotoCondensed-Light", size: self.fontSize) ?? .systemFont(ofSize: self.fontSize)
            case .mediumBold:
                return UIFont(name: "RobotoCondensed-Bold", size: self.fontSize) ?? .systemFont(ofSize: self.fontSize)
            case .medium:
                return UIFont(name: "RobotoCondensed-Regular", size: self.fontSize) ?? .systemFont(ofSize: self.fontSize)
            case .smallLight:
                return UIFont(name: "RobotoCondensed-Light", size: self.fontSize) ?? .systemFont(ofSize: self.fontSize)
            case .small:
                return UIFont(name: "RobotoCondensed-Regular", size: self.fontSize) ?? .systemFont(ofSize: self.fontSize)
            case .smallBold:
                return UIFont(name: "RobotoCondensed-Bold", size: self.fontSize) ?? .systemFont(ofSize: self.fontSize)
            case .default:
                return .systemFont(ofSize: self.fontSize)
            }
        }
    }
}

protocol LabeStyle {
    func customFont(familFont: FamilyFont) -> UIFont
}

extension UIFont {
    static func customFont(family: FamilyFont, style: LabeStyleGuide) -> UIFont {
        switch family {
        case .nunito:
            return nunitoFont(style: style)
        case .robotoCondensed:
            return robotoFont(style: style)
        }
    }
    
    static private func nunitoFont(style: LabeStyleGuide) -> UIFont {
        return style.customFont(familFont: .nunito)
    }
    
    static private func robotoFont(style: LabeStyleGuide) -> UIFont {
        return style.customFont(familFont: .robotoCondensed)
    }
}
