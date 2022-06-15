//
//  NavigationViewModel.swift
//  CampaignDemo
//
//  Created by Berkay Disli on 15.06.2022.
//

import Foundation

class NavigationViewModel: ObservableObject {
    
    @Published var tabSelection: Tabs = .shop
    @Published var onboarding = true
    
    init() {
        onboardStarted()
    }
    
    func setTab(tab: Tabs) {
        tabSelection = tab
    }
    
    func onboardStarted() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.onboarding = false
        }
    }
}
