//
//  ContentView.swift
//  CampaignDemo
//
//  Created by Berkay Disli on 15.06.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var navVM: NavigationViewModel
    
    var body: some View {
        if !navVM.onboarding {
            TabManager()
                .transition(AnyTransition.opacity.animation(.easeInOut))
        } else {
            Onboarding()
                .transition(AnyTransition.opacity.animation(.easeInOut))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(NavigationViewModel())
    }
}
