//
//  ProductModel.swift
//  Idillika
//
//  Created by Eldar on 23.08.2020.
//  Copyright © 2020 test. All rights reserved.
//

import Foundation

struct ProductModel: Codable {
    let id: Int
    let imageLink: String
    let title: String
    let price: Int
    let brand: String
}
