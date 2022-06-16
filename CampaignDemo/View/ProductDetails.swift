//
//  ProductDetails.swift
//  CampaignDemo
//
//  Created by Berkay Disli on 16.06.2022.
//

import SwiftUI
import Kingfisher

struct ProductDetails: View {
    let product: Product
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var navVM: NavigationViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack {
                TabView(content: {
                    ForEach(product.images, id:\.self) { img in
                        KFImage(URL(string: img))
                            .resizable()
                            .scaledToFit()
                    }
                })
                .tabViewStyle(.page(indexDisplayMode: .always))
                .frame(height: 330)
                .padding(.bottom, 25)
                
                // infos
                VStack(alignment: .leading, spacing: 10) {
                    Text(product.category.name)
                        .font(.title2)
                    Text(product.title)
                        .font(.largeTitle)
                        .fontWeight(.medium)
                    Text("US$\(product.price)")
                        .font(.title2)
                        .fontWeight(.medium)
                    Text(product.description)
                        .font(.title3)
                        .lineSpacing(10)
                        .padding(.top)
                    
                    Text("View Product Details")
                        .foregroundColor(.gray)
                        .padding(.vertical, 25)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                
                //buttons
                VStack(spacing: 20) {
                    ButtonComp(color: .white, textColor: .black, text: "Select Size", iconname: "chevron.down", iconColor: .black)
                    
                    ButtonComp(color: .black, textColor: .white, text: "Add to Bag", iconname: "bag.fill", iconColor: .white)
                    
                    ButtonComp(color: .white, textColor: .black, text: "Favourite", iconname: "heart", iconColor: .black)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Get Your Gear Faster")
                        .fontWeight(.medium)
                    HStack {
                        Text("Look for store pickup at checkout.")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                }
                .padding(.horizontal)
                .frame(height: 100)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.gray.opacity(0.17))
                .padding(.horizontal)
                .padding(.vertical, 40)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Delivery")
                        .fontWeight(.medium)
                    
                    Text("To get accurate delivery information")
                    
                    Text("Edit Location")
                        .fontWeight(.medium)
                        .underline()
                        .padding(.bottom)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
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
                .environmentObject(NavigationViewModel())
        }
    }
}
