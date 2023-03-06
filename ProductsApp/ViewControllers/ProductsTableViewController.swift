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
        fetchProducts()
        
    }
    
    private func fetchProducts() {
        NetworkManager.shared.fetch(dataType: StoreApp.self, url: List.url.rawValue) { storeApp in
            self.products = storeApp.product
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
        
        return cell
    }
    
    
}



