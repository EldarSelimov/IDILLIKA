//
//  CartManager.swift
//  Idillika
//
//  Created by Eldar on 23.08.2020.
//  Copyright © 2020 test. All rights reserved.
//

import Foundation

class CartManager {
    static let shared = CartManager()
    private init() {}
    
    private let defaults = UserDefaults.standard
    private let productKey = "LIKE_PRODUCT"
    
    private var likedProducts: [Int] {
        let array = defaults.object(forKey: productKey) as? [Int]
        return array ?? []
    }
    
    func productLiked(by id: Int) -> Bool {
        return likedProducts.contains(id)
    }
    
    func toggleFavorite(_ id: Int) -> Bool {
        var liked: Bool
        var clothersIds = likedProducts
        if clothersIds.contains(id), let index = clothersIds.firstIndex(of: id) {
            clothersIds.remove(at: index)
            liked = false
        } else {
            clothersIds.append(id)
            liked = true
        }
        
        defaults.set(clothersIds, forKey: productKey)
        return liked
    }
}
