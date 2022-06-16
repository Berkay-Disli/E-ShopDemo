//
//  ProductDetails.swift
//  CampaignDemo
//
//  Created by Berkay Disli on 16.06.2022.
//

import SwiftUI

struct ProductDetails: View {
    let product: Product
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var navVM: NavigationViewModel
    
    var body: some View {
        VStack {
            VStack {
                Text(product.title)
            }
            
            .onAppear(perform: {
                navVM.closeTabBar()
            })
            .navigationTitle(product.title)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "chevron.left")
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
        }
    }
}

struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductDetails(product: Product(title: "Tasty Rubber Tuna", price: 258, description: "The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive", category: Category(name: "Shoes", image: "https://api.lorem.space/image/shoes?w=640&h=480&r=5906"), images: ["https://api.lorem.space/image/shoes?w=640&h=480&r=2890", "https://api.lorem.space/image/shoes?w=640&h=480&r=1841", "https://api.lorem.space/image/shoes?w=640&h=480&r=9751"]))
        }
    }
}
