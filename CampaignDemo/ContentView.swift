//
//  ContentView.swift
//  CampaignDemo
//
//  Created by Berkay Disli on 15.06.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabManager()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(NavigationViewModel())
    }
}
