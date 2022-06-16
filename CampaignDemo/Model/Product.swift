//
//  Product.swift
//  CampaignDemo
//
//  Created by Berkay Disli on 16.06.2022.
//

import Foundation

struct Product: Hashable, Codable {
    let title: String
    let price: Int
    let description: String
    let category: Category
    let images: [String]
}

struct Category: Hashable, Codable {
    let name: String
    let image: String
}
