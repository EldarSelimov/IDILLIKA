//
//  ProductsCollectionViewController.swift
//  Idillika
//
//  Created by Eldar on 23.08.2020.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit

fileprivate let reuseIdentifier = "productCell"

class ProductsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cartManager = CartManager.shared
    
    private var products: [ProductModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = navigationItem.title?.uppercased()
        NetworkManager.shared.getProductList(succes: { [weak self] (products) in
            self?.productsLoaded(products)
        }) { (error) in
            print(error)
        }
        
    }
    
    
    private func productsLoaded(_ list: [ProductModel]) {
        self.products = list
        collectionView.reloadData()
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return products.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProductCollectionViewCell
        
        let product = products[indexPath.row]
        let isLiked = cartManager.productLiked(by: product.id)
        cell.configure(with: product, isLiked)
        
        return cell
        
    }
    
    // MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - 25
        return CGSize(width: width, height: width * 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}






