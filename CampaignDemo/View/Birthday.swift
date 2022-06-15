//
//  Birthday.swift
//  CampaignDemo
//
//  Created by Berkay Disli on 15.06.2022.
//

import SwiftUI
import Kingfisher

struct Birthday: View {
    @State private var user = "Leyla"
    @EnvironmentObject var navVM: NavigationViewModel
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                VStack(alignment: .leading) {
                    Text("\(user),")
                        .animation(.none)
                    
                    Text("Happy birthday!")
                        .padding(.bottom, 2)
                    
                    VStack(alignment: .leading, spacing: 3) {
                        Text("We've prepared a special discount for you.")
                        Text("Have fun!")
                    }
                    .font(.title3)
                    .fontWeight(.medium)
                        
                }
                .font(.largeTitle).fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                
                VStack {
                    Text("Your Presents")
                        .font(.title2).fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading).padding(.top)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 3) {
                            ForEach(Presents.allCases, id:\.self) { item in
                                VStack(alignment: .leading) {
                                    KFImage(item.url)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 160)
                                    Text(item.discounts)
                                        .fontWeight(.medium)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .frame(height: 155)
                }
            }
            
            if navVM.showBalloon {
                Image("balloon")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .padding(.trailing, 30)
                    .scaleEffect(navVM.balloonAnimation ? 1.15: 1.0)
                    .offset(y: !navVM.balloonAnimation ? 10:0)
                    .transition(AnyTransition.scale.animation(.easeInOut(duration: 0.2)))
                    .onAppear(perform: {
                        withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                            navVM.animateBalloon()
                        }
                    })
                    .onTapGesture {
                        navVM.popBalloon()
                    }
            }
            
            
        }
    }
}

struct Birthday_Previews: PreviewProvider {
    static var previews: some View {
        Birthday()
            .environmentObject(NavigationViewModel())
    }
}
