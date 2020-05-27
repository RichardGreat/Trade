//
//  FilterButtons.swift
//  Trade
//
//  Created by Richard on 5/21/20.
//  Copyright © 2020 Orbita. All rights reserved.
//
import UIKit
import Foundation


class ShoppingBagButton: UIButton {
    
    private let title: String
    private let image: UIImage
    
    init(title: String, image: UIImage) {
        self.title = title
        self.image = image
        super.init(frame: .zero)
        configureButton()
    }
    
    private func configureButton() {
        setTitle(title, for: .normal)
        setImage(image, for: .normal)
        titleLabel?.font = UIFont.yandexSansTextMedium(size: 10)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 2
        expandTitleAndImage()
    }
    
    
    private func expandTitleAndImage() {
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
