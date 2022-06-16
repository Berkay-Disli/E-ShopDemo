//
//  ProductViewModel.swift
//  CampaignDemo
//
//  Created by Berkay Disli on 16.06.2022.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var productsToShow = [Product]()
    
    init() {
        getProductsShoes()
    }
    
    func getProductsShoes() {
        guard let url = URL(string: "https://api.escuelajs.co/api/v1/categories/4/products?offset=0&limit=30") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data, error == nil {
                do {
                    let result = try JSONDecoder().decode([Product].self, from: data)
                    
                    DispatchQueue.main.async {
                        self.productsToShow = result
                    }
                } catch let error {
                    print(error)
                }
            }
        }
        .resume()
    }
}
