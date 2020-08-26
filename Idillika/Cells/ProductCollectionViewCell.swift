//
//  ProductCollectionViewCell.swift
//  Idillika
//
//  Created by Eldar on 23.08.2020.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit
import Kingfisher


class ProductCollectionViewCell: UICollectionViewCell, UICollectionViewDelegateFlowLayout {
    
    private let cartManager = CartManager.shared
    private var id: Int!
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productBrandLabel: UILabel!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var likeButtonImage: UIButton!
    
    private var isLiked: Bool = false {
        didSet {
            toggleProduct()
        }
    }
    
    func configure(with product: ProductModel, _ isLiked: Bool) {
        self.id = product.id
        self.isLiked = isLiked
        productImageView.kf.setImage(with: URL(string: product.imageLink))
        
        productBrandLabel.text = product.brand
        productTitleLabel.text = product.title
        
        productPriceLabel.text = "\(product.price) ₽"
    }
    
    @IBAction func likeButtonAction(_ sender: UIButton) {
        let toggle = cartManager.toggleFavorite(id)
        isLiked = toggle
    }
    
    private func toggleProduct() {
        let imageName = isLiked ? "like-fill" : "like"
        likeButtonImage?.setBackgroundImage(UIImage(named: imageName), for: .normal)
    }
}
