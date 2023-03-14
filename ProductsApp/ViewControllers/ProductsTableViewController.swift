//
//  ProductsTableViewController.swift
//  ProductsApp
//
//  Created by Роман Бакаев on 02.03.2023.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    
    private var products: [ProductInfo] = []
    
    private let borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).cgColor
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.rowHeight = 120
        fetchProducts()
        
    }
    
    private func fetchProducts() {
        NetworkManager.shared.fetchProducts(url: List.url.rawValue) { product in
            self.products = product
            self.tableView.reloadData()
        }
        }
        
    }

// MARK: - Table view data source


extension ProductsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? ProductViewCell else { return UITableViewCell() }
        
        let product = products[indexPath.row]
        cell.configure(product: product)
        
        cell.layer.cornerRadius = 20
        cell.layer.borderWidth = CGFloat(2)
        cell.layer.borderColor = borderColor
        cell.productImageView.layer.cornerRadius = 20
        
        return cell
    }
    
    
    
}



