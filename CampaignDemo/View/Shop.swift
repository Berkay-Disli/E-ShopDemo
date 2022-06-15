//
//  Home.swift
//  CampaignDemo
//
//  Created by Berkay Disli on 15.06.2022.
//

import SwiftUI
import Kingfisher

struct Shop: View {
    @State private var categorySelection: Gender = .men
    @Namespace var id
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    //header
                    VStack {
                        /*HStack {
                            Image(systemName: "magnifyingglass")
                                .font(.title2)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing).padding(.bottom, 8)
                        } */
                        
                        /*HStack {
                            Text("Shop")
                                .font(.system(size: 40))
                                .fontWeight(.medium)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading)
                        } */
                        
                        VStack(spacing: 0) {
                            LazyHStack {
                                ForEach(Gender.allCases, id:\.self) { category in
                                    VStack {
                                        Text(category.title)
                                            .font(.title3).fontWeight(.medium)
                                            .foregroundColor(categorySelection == category ? .black:.gray )
                                        Capsule().fill(categorySelection == category ? .black:.clear)
                                            .frame(height: 2)
                                            
                                    }
                                    .padding(.trailing, 20)
                                    .onTapGesture {
                                        withAnimation(.easeInOut) {
                                            categorySelection = category
                                        }
                                    }
                                    
                                }
                            }
                            .frame(height: 50)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 27).padding(.top)
                            
                            Divider().offset(y: -4)
                        }
                        
                        Text("Must-Haves, Best Sellers & More")
                            .font(.title2).fontWeight(.medium)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 27).padding(.vertical)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(MustHaves.allCases, id: \.self) { item in
                                    VStack(alignment: .leading) {
                                        KFImage(item.url)
                                            .resizable()
                                            .frame(width: 250, height: 250)
                                            
                                        Text(item.title)
                                            .fontWeight(.medium)
                                            .padding(.top)
                                    }
                                }
                            }
                            .padding(.horizontal, 27)
                        }
                        .frame(height: 300)
                        
                        VStack(spacing: 3) {
                            ForEach(WideFeatured.allCases, id: \.self) { item in
                                ZStack {
                                    Color.black.opacity(0.85)
                                        .frame(height: 130)
                                    HStack {
                                        Text(item.title)
                                            .font(.title2).fontWeight(.medium)
                                            .foregroundColor(.white)
                                        Spacer()
                                        KFImage(item.url)
                                            .resizable()
                                            .scaledToFit()
                                            .clipShape(Circle())
                                            .frame(width: 128, height: 128)
                                            .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 5)
                                    }
                                    .padding(.horizontal, 27)
                                }
                            }
                        }
                        .padding(.top, 27)
                        
                        Color.white
                            .frame(width: UIScreen.main.bounds.width, height: 44)
                        
                    }
                    
                    Spacer()
                }
                .edgesIgnoringSafeArea(.bottom)
                .navigationBarBackButtonHidden()
                .navigationTitle("Shop")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Image(systemName: "magnifyingglass")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing).padding(.bottom, 8)
                    }
            }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Shop()
            .environmentObject(NavigationViewModel())
    }
}
