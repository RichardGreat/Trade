//
//  ProductDetailViewController.swift
//  Trade
//
//  Created by Richard on 5/21/20.
//  Copyright © 2020 Orbita. All rights reserved.
//
import UIKit
import Foundation

class ProductDetailViewController: UIViewController {
    
    private let favoriteButton = RoundButton(image: #imageLiteral(resourceName: "favorite"))
    private let shoppingButton = ShoppingBagButton(title: "В КОРЗИНКУ", image: UIImage())
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let productImageBackgroundView = UIView()
    private let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.yandexSansTextBold(size: 18)
        return lbl
    }()
    
    private let detailLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.yandexSansTextRegular(size: 14)
        lbl.textColor = UIColor(displayP3Red: 124 / 255, green: 138 / 255,
                                blue: 152 / 255, alpha: 1)
        lbl.lineBreakMode = .byWordWrapping
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let priceLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.yandexSansTextBold(size: 24)
        return lbl
    }()
    
    private let model: Product
    
    init(model: Product) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
        setUpIerarhyOfSubviews()
        configureSubviewsWithModel()
    }
    
    private func configureSubviewsWithModel() {
        shoppingButton.backgroundColor = .black
        shoppingButton.titleLabel?.font = UIFont.yandexSansTextLight(size: 16)
        productImageView.image = UIImage(imageLiteralResourceName: model.imageName)
        
        titleLbl.text = model.title
        detailLbl.text = model.detail
        priceLbl.text = model.price
    }
    
    private func setUpIerarhyOfSubviews() {
    
        productImageBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        detailLbl.translatesAutoresizingMaskIntoConstraints = false
        priceLbl.translatesAutoresizingMaskIntoConstraints = false
        shoppingButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(productImageBackgroundView)
        view.addSubview(titleLbl)
        view.addSubview(detailLbl)
        view.addSubview(priceLbl)
        view.addSubview(shoppingButton)
        
        productImageBackgroundView.addSubview(productImageView)
        productImageBackgroundView.addSubview(favoriteButton)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        productImageBackgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        productImageBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        productImageBackgroundView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.6).isActive = true
        productImageBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        productImageView.centerYAnchor.constraint(equalTo: productImageBackgroundView.centerYAnchor).isActive = true
        productImageView.centerXAnchor.constraint(equalTo: productImageBackgroundView.centerXAnchor).isActive = true
        productImageView.leadingAnchor.constraint(equalTo: productImageBackgroundView.leadingAnchor,
                                                  constant: 20).isActive = true
        productImageView.trailingAnchor.constraint(equalTo: productImageBackgroundView.trailingAnchor,
                                                   constant: -20).isActive = true
        productImageView.topAnchor.constraint(equalTo: productImageBackgroundView.topAnchor,
                                              constant: 20).isActive = true
        productImageView.bottomAnchor.constraint(equalTo: productImageBackgroundView.bottomAnchor,
                                                 constant: -20).isActive = true
        
        favoriteButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        favoriteButton.trailingAnchor.constraint(equalTo: productImageBackgroundView.trailingAnchor,
                                                 constant: -10).isActive = true
        favoriteButton.topAnchor.constraint(equalTo: productImageBackgroundView.topAnchor,
                                            constant: 10).isActive = true
        
        titleLbl.topAnchor.constraint(equalTo: productImageBackgroundView.bottomAnchor,
                                      constant: 20).isActive = true
        titleLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                          constant: 10).isActive = true
        
        detailLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 10).isActive = true
        detailLbl.leadingAnchor.constraint(equalTo: titleLbl.leadingAnchor).isActive = true
        detailLbl.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        
        priceLbl.topAnchor.constraint(equalTo: detailLbl.bottomAnchor, constant: 10).isActive = true
        priceLbl.leadingAnchor.constraint(equalTo: titleLbl.leadingAnchor).isActive = true
      
        shoppingButton.leadingAnchor.constraint(equalTo: titleLbl.leadingAnchor).isActive = true
        shoppingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        shoppingButton.topAnchor.constraint(equalTo: priceLbl.bottomAnchor,
                                            constant: 20).isActive = true
        shoppingButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
