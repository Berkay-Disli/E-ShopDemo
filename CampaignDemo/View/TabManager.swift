//
//  TabManager.swift
//  CampaignDemo
//
//  Created by Berkay Disli on 15.06.2022.
//

import SwiftUI

struct TabManager: View {
    
    @EnvironmentObject var navVM: NavigationViewModel
    @State private var showSheet = true
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            Shop()
            
            if navVM.showTabBar {
                VStack(spacing: 0) {
                    Divider()
                    HStack(spacing: 33){
                        ForEach(Tabs.allCases, id: \.self) { tab in
                            VStack(spacing: 4) {
                                Image(systemName: tab.icon)
                                    .font(.system(size: 28))
                                Text(tab.title)
                                    .font(.callout)
                            }
                            .padding(.vertical, 4)
                            .foregroundColor(navVM.tabSelection == tab ? .black:.black.opacity(0.46))
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    navVM.setTab(tab: tab)
                                }
                            }
                        }
                    }
                    .padding(.top, 8)
                    .frame(width: UIScreen.main.bounds.width, height: 100, alignment: .top)
                    .background(.white)
                }
                .transition(AnyTransition.scale.animation(.easeInOut))
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .onAppear(perform: {
            navVM.showSheet()
        })
        .sheet(isPresented: $navVM.showBirthdaySheet) {
            Birthday()
                .presentationDetents([.height(420)])
        }
    }
}

struct TabManager_Previews: PreviewProvider {
    static var previews: some View {
        TabManager()
            .environmentObject(NavigationViewModel())
    }
}
