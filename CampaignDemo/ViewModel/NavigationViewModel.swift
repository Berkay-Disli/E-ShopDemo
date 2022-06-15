//
//  NavigationViewModel.swift
//  CampaignDemo
//
//  Created by Berkay Disli on 15.06.2022.
//

import Foundation

class NavigationViewModel: ObservableObject {
    
    @Published var tabSelection: Tabs = .shop
    
    init() {
        
    }
    
    func setTab(tab: Tabs) {
        tabSelection = tab
    }
}
