//
//  Product.swift
//  ProductsApp
//
//  Created by Роман Бакаев on 02.03.2023.
//

import Foundation

struct StoreApp:Decodable {
    
    let products: [ProductInfo]
    
}

struct ProductInfo: Decodable {
    let title: String
    let price: Int
    let category: String
    let thumbnail: String
    
    init(value: [String: Any]) {
        title = value["title"] as? String ?? ""
        price = value["price"] as? Int ?? 0
        category = value["category"] as? String ?? ""
        thumbnail = value["thumbnail"] as? String ?? ""
        
    }
    
    static func getProductInfo(from value: Any) -> [ProductInfo] {
        guard let value = value as? [String: Any] else {return[]}
        guard let products = value["products"] as? [[String: Any]] else {return[]}
        var productsArray = [ProductInfo]()
        
        for product in products {
            let product = ProductInfo(value: product)
            productsArray.append(product)
        }
        return productsArray
    }
}
