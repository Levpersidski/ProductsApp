//
//  Product.swift
//  ProductsApp
//
//  Created by Роман Бакаев on 02.03.2023.
//

import Foundation

struct StoreApp:Decodable {
    
    let product: [ProductInfo]
}

struct ProductInfo: Decodable {
    let title: String
    let price: Int
    let category: String
    let thumbnail: String
    
}
