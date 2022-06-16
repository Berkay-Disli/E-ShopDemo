//
//  ShoppingList.swift
//  CampaignDemo
//
//  Created by Berkay Disli on 16.06.2022.
//

import SwiftUI
import Kingfisher

struct ShoppingList: View {
    @Environment(\.dismiss) var dismiss
    @State private var categorySelection: ShoesCategories = .all
    @StateObject var productVM = ProductViewModel()
    @State private var goToDetails = false
    @EnvironmentObject var navVM: NavigationViewModel
    
    let columns = [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 20)]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(ShoesCategories.allCases, id:\.self) { category in
                        VStack {
                            Text(category.title)
                                .font(.title3).fontWeight(.medium)
                                .foregroundColor(categorySelection == category ? .black:.gray )
                            Capsule().fill(categorySelection == category ? .black:.clear)
                                .frame(width: 80,height: 2)
                                
                        }
                        .padding(.trailing, 20)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                categorySelection = category
                            }
                        }
                    }
                }
            }
            .frame(height: 50)
            .padding(.bottom, -10)
            
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 40) {
                    ForEach(productVM.productsToShow, id:\.self) { item in
                        NavigationLink {
                            ProductDetails(product: item)
                        } label: {
                            VStack(alignment: .leading, spacing: 15) {
                                KFImage(URL(string: item.images[0]))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 210)
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(item.title)
                                    Text("5 Colours")
                                        .fontWeight(.regular)
                                        .foregroundColor(.gray)
                                    Text("US$\(item.price)")
                                }
                                .foregroundColor(.black)
                                .fontWeight(.medium)
                                .padding(.leading)
                            }
                            .frame(height: 250)
                        }

                    }
                }
            }
            
            
            
        }
        .onAppear(perform: {
            navVM.openTabBar()
        })
        .navigationTitle("Shoes")
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "magnifyingglass")
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
        
    }
}

struct ShoppingList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ShoppingList()
                .environmentObject(NavigationViewModel())
        }
    }
}
