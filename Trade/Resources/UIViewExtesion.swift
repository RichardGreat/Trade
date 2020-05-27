//
//  UIButtonExtesion.swift
//  Trade
//
//  Created by Richard on 5/22/20.
//  Copyright © 2020 Orbita. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addShadow(color: UIColor = .lightGray,
                   opacity: Float = 1,
                   shadowRadius: CGFloat = 3,
                   shadowOffset: CGSize = .zero) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = shadowOffset
        translatesAutoresizingMaskIntoConstraints = false
        layer.masksToBounds = false
    }
}
