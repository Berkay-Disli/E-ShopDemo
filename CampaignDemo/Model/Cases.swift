//
//  Cases.swift
//  CampaignDemo
//
//  Created by Berkay Disli on 15.06.2022.
//

import Foundation


enum Tabs: String, CaseIterable {
    case shop, express, favourites, bag, profile
    
    var title: String {
        switch self {
        case .shop:
            return "Shop"
        case .express:
            return "Express"
        case .favourites:
            return "Favourites"
        case .bag:
            return "Bag"
        case .profile:
            return "Profile"
        }
    }
    
    var icon: String {
        switch self {
        case .shop:
            return "magnifyingglass"
        case .express:
            return "airplane.departure"
        case .favourites:
            return "heart"
        case .bag:
            return "bag"
        case .profile:
            return "person"
        }
    }
}


enum Gender: String, CaseIterable {
    case men, women, kids
    
    var title: String {
        switch self {
        case .men:
            return "Men"
        case .women:
            return "Women"
        case .kids:
            return "Kids"
        }
    }
}

enum MustHaves: String, CaseIterable {
    case best, must, featured, latest
    
    var title: String {
        switch self {
        case .best:
            return "Best Sellers"
        case .must:
            return "Must-Haves"
        case .featured:
            return "Featured"
        case .latest:
            return "Latest"
        }
    }
    
    var url: URL {
        switch self {
        case .best:
            return URL(string: "https://api.lorem.space/image/shoes?w=640&h=480&r=2291")!
        case .must:
            return URL(string: "https://cdn.lorem.space/images/shoes/.cache/640x480/daniel-storek-JM-qKEd1GMI-unsplash.jpg")!
        case .featured:
            return URL(string: "https://cdn.lorem.space/images/shoes/.cache/640x480/trendest-studio-XZ3EmAIWuz0-unsplash.jpg")!
        case .latest:
            return URL(string: "https://api.lorem.space/image/shoes?w=640&h=480&r=3573")!
        }
    }
}

enum WideFeatured: String, CaseIterable {
    case new, shoes, clothing, sale, accessory
    
    var title: String {
        switch self {
        case .new:
            return "New & Featured"
        case .shoes:
            return "Shoes"
        case .clothing:
            return "Clothing"
        case .sale:
            return "Sale - Up to 40% Off"
        case .accessory:
            return "Accessories"
        }
    }
    
    var url: URL {
        switch self {
        case .new:
            return URL(string: "https://api.lorem.space/image/shoes?w=640&h=480&r=853")!
        case .shoes:
            return URL(string: "https://api.lorem.space/image/shoes?w=640&h=480&r=8336")!
        case .clothing:
            return URL(string: "https://api.lorem.space/image/fashion?w=640&h=480&r=7377")!
        case .sale:
            return URL(string: "https://cdn.lorem.space/images/shoes/.cache/640x480/matthew-dagelet-tBdkpxj3A7Q-unsplash.jpg")!
        case .accessory:
            return URL(string: "https://api.lorem.space/image/watch?w=640&h=480&r=4643")!
        }
    }
}
