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
Category: \(product.category)

Name: \(product.title)

Price is \(product.price)$
        
"""
        NetworkManager.shared.fetchImage(from: product.thumbnail) { data in
            self.productImageView.image = UIImage(data: data)
        }
    }
}
