//
//  Onboarding.swift
//  CampaignDemo
//
//  Created by Berkay Disli on 15.06.2022.
//

import SwiftUI

struct Onboarding: View {
    @State private var user = "Leyla"
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("Hi \(user),")
                Text("Welcome back.")
            }
            .font(.largeTitle)
            .fontWeight(.medium)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            VStack {
                Spacer()
                Text("Member Since 2020")
                    .foregroundColor(.gray)
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
            .environmentObject(NavigationViewModel())
    }
}
