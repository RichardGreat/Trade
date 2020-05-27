//
//  ViewController.swift
//  Trade
//
//  Created by Richard on 5/21/20.
//  Copyright © 2020 Orbita. All rights reserved.
//

import UIKit

class ProductListController: UIViewController {
    
    private let similarProductFilterButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "similar_button"), for: .normal)
        button.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.4).cgColor
        button.layer.borderWidth = 0.5
        return button
    }()
    
    private let filterButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "filter_button"), for: .normal)
        button.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.4).cgColor
        button.layer.borderWidth = 0.5
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.tableFooterView = UIView(frame: .zero)
        table.register(ProductListCell.self, forCellReuseIdentifier: ProductListCell.reuseId)
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    private let viewModel = ProductListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        configureNavigationBar()
        setUpIerarhyOfSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Товары"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        title = ""
    }
    private func setUpIerarhyOfSubviews() {
        similarProductFilterButton.translatesAutoresizingMaskIntoConstraints = false
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(similarProductFilterButton)
        view.addSubview(filterButton)
        view.addSubview(tableView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        similarProductFilterButton
            .topAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
            .isActive = true
        similarProductFilterButton
            .leadingAnchor
            .constraint(equalTo: view.leadingAnchor)
            .isActive = true
        similarProductFilterButton
            .trailingAnchor
            .constraint(equalTo: view.centerXAnchor)
            .isActive = true
        similarProductFilterButton
            .heightAnchor
            .constraint(equalToConstant: 45)
            .isActive = true
        
        filterButton
            .topAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
            .isActive = true
        filterButton
            .trailingAnchor
            .constraint(equalTo: view.trailingAnchor)
            .isActive = true
        filterButton
            .leadingAnchor
            .constraint(equalTo: view.centerXAnchor)
            .isActive = true
        filterButton
            .heightAnchor
            .constraint(equalToConstant: 45)
            .isActive = true
        
        tableView
            .topAnchor
            .constraint(equalTo: filterButton.bottomAnchor)
            .isActive = true
        tableView
            .leadingAnchor
            .constraint(equalTo: view.leadingAnchor)
            .isActive = true
        tableView
            .trailingAnchor
            .constraint(equalTo: view.trailingAnchor)
            .isActive = true
        tableView
            .bottomAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            .isActive = true
    }
}

extension ProductListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductListCell.reuseId,
                                                 for: indexPath) as! ProductListCell
        let product = viewModel.items[indexPath.row]
        cell.configure(with: product)
        return cell
    }
}

extension ProductListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = viewModel.items[indexPath.row]
        showProductDetails(product: product)
    }
    
    private func showProductDetails(product: Product) {
        let vc = ProductDetailViewController(model: product)
        navigationController?.pushViewController(vc, animated: true)
    }
}
