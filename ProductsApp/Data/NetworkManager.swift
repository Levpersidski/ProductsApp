//
//  NetworkManager.swift
//  ProductsApp
//
//  Created by Роман Бакаев on 02.03.2023.
//

import Foundation

enum NetworkError: Error{
    case invalidURL
    case noData
    case decodingError
}

enum List: String {
    case url = "https://dummyjson.com/products"
}

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchProducts(url: String, completion: @escaping([ProductInfo]) -> Void ) {
        guard let url = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                return
            }
            
            do {
                let type = try JSONSerialization.jsonObject(with: data)
                DispatchQueue.main.async {
                    let products = ProductInfo.getProductInfo(from: type)
                    completion(products)
                }
            
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func fetchImage(from url: String, completion:@escaping(Data) -> Void) {
        guard let url = URL(string: url) else {return}
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {return}
            DispatchQueue.main.async {
                completion(imageData)
            }
        }
        
    }
    
    private init() {}
}
