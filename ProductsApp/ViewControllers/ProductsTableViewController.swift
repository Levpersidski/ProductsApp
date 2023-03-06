//
//  ProductsTableViewController.swift
//  ProductsApp
//
//  Created by Роман Бакаев on 02.03.2023.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    
    var products: [ProductInfo] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.rowHeight = 120
        fetchProducts()
        
    }
    
    private func fetchProducts() {
        NetworkManager.shared.fetch(dataType: StoreApp.self, url: List.url.rawValue) { storeApp in
            self.products = storeApp.products
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
        cell.layer.borderColor = CGColor.init(red: 0.5, green: 0.5, blue: 0.5,  alpha: 0.5)
        cell.productImageView.layer.cornerRadius = 20
        
        return cell
    }
    
    
    
}



