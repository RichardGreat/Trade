//
//  UIFontExtensions.swift
//  Trade
//
//  Created by Richard on 5/21/20.
//  Copyright © 2020 Orbita. All rights reserved.
//

import Foundation

import UIKit

extension UIFont {
    static func yandexSansTextBold(size: CGFloat) -> UIFont {
        return fonts(with: "YandexSansText_Bold",
                     and: size, type:  .bold)
    }
    
    static func yandexSansTextLight(size: CGFloat) -> UIFont {
        return fonts(with: "YandexSansText-Light",
                     and: size, type:  .athor)
    }
    
    static func yandexSansTextMedium(size: CGFloat) -> UIFont {
        return fonts(with: "YandexSansText-Medium",
                     and: size, type:  .athor)
    }
    
    static func yandexSansTextRegular(size: CGFloat) -> UIFont {
        return fonts(with: "YandexSansText-Regular",
                     and: size, type:  .athor)
    }
    
    private static func fonts(with name: String,
                       and size: CGFloat,
                       type: FontType) -> UIFont {
        var replacement: UIFont!
        switch type {
        case .bold:
            replacement = UIFont.boldSystemFont(ofSize: size)
        default:
            replacement = UIFont.systemFont(ofSize: size)
        }
        return UIFont(name: name, size: size) ?? replacement
    }
}

enum FontType {
    case bold
    case athor
}
