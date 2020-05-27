//
//  ProductListCell.swift
//  Trade
//
//  Created by Richard on 5/22/20.
//  Copyright © 2020 Orbita. All rights reserved.
//
import UIKit
import Foundation

class ProductListCell: UITableViewCell {
    
    static let reuseId = String(describing: ProductListCell.self)
    
    private let favoriteButton = RoundButton(image: #imageLiteral(resourceName: "favorite"))
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let productImageBackgroundView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor(displayP3Red: 238 / 255,
                                       green: 238 / 255, blue: 240 / 255,
                                       alpha: 1)
        return view
    }()
    private let titleLbl: UILabel = {
       let lbl = UILabel()
       lbl.font = UIFont.yandexSansTextBold(size: 14)
       return lbl
    }()
    
    private let detailLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.yandexSansTextRegular(size: 11)
        lbl.textColor = UIColor(displayP3Red: 124 / 255, green: 138 / 255,
                                blue: 152 / 255, alpha: 1)
        lbl.lineBreakMode = .byWordWrapping
        lbl.numberOfLines = 0
        return lbl
    }()

    private let priceLbl: UILabel = {
       let lbl = UILabel()
       lbl.font = UIFont.yandexSansTextBold(size: 20)
       return lbl
    }()
    
    private let deliveryDateImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "delivery"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let deliveryDateLbl: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    private let shoppingBagButton = ShoppingBagButton(title: "В Корзинку", image: #imageLiteral(resourceName: "shopping_bag"))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpIerarhyOfSubviews()
    }

    private func setUpIerarhyOfSubviews() {
        productImageBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        detailLbl.translatesAutoresizingMaskIntoConstraints = false
        priceLbl.translatesAutoresizingMaskIntoConstraints = false
        shoppingBagButton.translatesAutoresizingMaskIntoConstraints = false
        deliveryDateLbl.translatesAutoresizingMaskIntoConstraints = false
        deliveryDateImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(productImageBackgroundView)
        addSubview(titleLbl)
        addSubview(detailLbl)
        addSubview(priceLbl)
        addSubview(shoppingBagButton)
        addSubview(deliveryDateImageView)
        addSubview(deliveryDateLbl)
        
        productImageBackgroundView.addSubview(productImageView)
        productImageBackgroundView.addSubview(favoriteButton)
    }
    
    func configure(with model: Product) {
        selectionStyle = .none
        shoppingBagButton.backgroundColor = .black
        productImageView.image = UIImage(imageLiteralResourceName: model.imageName)
        
        titleLbl.text = model.title
        detailLbl.text = model.detail
        priceLbl.text = model.price
        
        let attributedString = NSMutableAttributedString(string: "Ближайшая доставка:\n",
                                                         attributes: [NSAttributedString.Key.font: UIFont.yandexSansTextRegular(size: 10)])
        let deliveryDate = NSAttributedString(string: model.delivery,
                                              attributes: [NSAttributedString.Key.font: UIFont.yandexSansTextBold(size: 10)])
        attributedString.append(deliveryDate)
        deliveryDateLbl.attributedText = attributedString
        layoutSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        productImageBackgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        productImageBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        productImageBackgroundView.heightAnchor.constraint(equalToConstant: 182).isActive = true
        productImageBackgroundView.widthAnchor.constraint(equalToConstant: 179).isActive = true
        productImageBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                           constant: -8).isActive = true
        
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
        
        titleLbl.topAnchor.constraint(equalTo: productImageBackgroundView.topAnchor,
                                      constant: 8).isActive = true
        titleLbl.leadingAnchor.constraint(equalTo: productImageBackgroundView.trailingAnchor,
                                          constant: 16).isActive = true
        
        detailLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 10).isActive = true
        detailLbl.leadingAnchor.constraint(equalTo: titleLbl.leadingAnchor).isActive = true
        detailLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        
        priceLbl.topAnchor.constraint(equalTo: detailLbl.bottomAnchor, constant: 10).isActive = true
        priceLbl.leadingAnchor.constraint(equalTo: titleLbl.leadingAnchor).isActive = true
        
        deliveryDateImageView.widthAnchor.constraint(equalToConstant: 22).isActive = true
        deliveryDateImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        deliveryDateImageView.topAnchor.constraint(equalTo: priceLbl.bottomAnchor,
                                                   constant: 10).isActive = true
        deliveryDateImageView.leadingAnchor.constraint(equalTo: titleLbl.leadingAnchor).isActive = true
        
        deliveryDateLbl.leadingAnchor.constraint(equalTo: deliveryDateImageView.trailingAnchor,
                                                 constant: 10).isActive = true
        deliveryDateLbl.topAnchor.constraint(equalTo: priceLbl.bottomAnchor,
                                             constant: 10).isActive = true
        deliveryDateLbl.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                  constant: -15).isActive = true
        
        shoppingBagButton.leadingAnchor.constraint(equalTo: titleLbl.leadingAnchor).isActive = true
        shoppingBagButton.topAnchor.constraint(equalTo: deliveryDateImageView.bottomAnchor,
                                               constant: 10).isActive = true
        shoppingBagButton.heightAnchor.constraint(equalToConstant: 31).isActive = true
        shoppingBagButton.widthAnchor.constraint(equalToConstant: 105).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
