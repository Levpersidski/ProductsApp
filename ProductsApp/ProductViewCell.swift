//
//  ProductViewCell.swift
//  ProductsApp
//
//  Created by Роман Бакаев on 02.03.2023.
//

import UIKit

class ProductViewCell:UITableViewCell {
    
    @IBOutlet var productInfoLabel: UILabel!
    @IBOutlet var productImageView: UIImageView!
    
    func configure (product: ProductInfo) {
        productInfoLabel.text =
"""
        \(product.title)
        price is \(product.price)
        \(product.category)
"""
        NetworkManager.shared.fetch(dataType: ProductInfo.self, url: product.thumbnail) { productInfo in
            NetworkManager.shared.fetchImage(from: productInfo.thumbnail) { data in
                self.productImageView.image = UIImage(data: data)
            }
        }
    }
}
