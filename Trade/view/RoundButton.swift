//
//  RoundButton.swift
//  Trade
//
//  Created by Richard on 5/22/20.
//  Copyright © 2020 Orbita. All rights reserved.
//
import UIKit
import Foundation


class RoundButton: UIButton {
    
    init(image: UIImage) {
        super.init(frame: .zero)
        setImage(image, for: .normal)
        clipsToBounds = true
        backgroundColor = .white
        addShadow(shadowRadius: 4.0, shadowOffset: CGSize(width: 0, height: 6))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width / 2
    }
}
