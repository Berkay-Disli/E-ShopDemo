//
//  Button.swift
//  CampaignDemo
//
//  Created by Berkay Disli on 16.06.2022.
//

import SwiftUI

struct ButtonComp: View {
    let color: Color
    let textColor: Color
    let text: String
    let iconname: String
    let iconColor: Color
    
    var body: some View {
        HStack {
            Spacer()
            Text(text)
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(textColor)
            
            Image(systemName: iconname)
                .font(.title3)
                .foregroundColor(iconColor)
            Spacer()
        }
        .frame(width: .infinity, height: 67)
        .background(color)
        .cornerRadius(100)
        .shadow(color: .black, radius: 0.6, x: 0, y: 0)
        .padding(.horizontal)
    }
}

struct ButtonComp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonComp(color: .white, textColor: .black, text: "", iconname: "", iconColor: .black)
            
    }
}
