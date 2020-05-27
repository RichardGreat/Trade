//
//  NavigationControllerViewController.swift
//  Trade
//
//  Created by Richard on 5/21/20.
//  Copyright © 2020 Orbita. All rights reserved.
//
import UIKit

extension UIViewController {
    public func configureNavigationBar() {
        
        navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "back_button")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "back_button")
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain,
                                                           target: self, action: nil)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.font: UIFont.yandexSansTextMedium(size: 16),
             NSAttributedString.Key.foregroundColor: UIColor.black]
    }
}
