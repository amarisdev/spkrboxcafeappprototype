//
//  MenuItemCard.swift
//  MyApp
//
//  Created by Mars on 9/23/26.
//

import SwiftUI

struct MenuItemCard: View {
    let imageName: String
    let title: String
    let price: String
    var body: some View {
        VStack (spacing: 4) {
            Image(imageName) // Use SystemName, SF Symbols, or Assets
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .cornerRadius(12)
                .overlay(
            RoundedRectangle(cornerRadius: 12) .stroke(Color.white, lineWidth: 2)
                )
            Text(title)
                .font(.caption)
                .bold()
                .foregroundColor(.white)
            Text(price)
                .font(.caption2)
                .bold()
                .padding (.horizontal, 8)
                .padding(.vertical, 2)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(6)
            
        
        
        }
    }
}

#Preview {
    MenuItemCard(imageName: "coffee", title: "Coffee (12oz)", price: "$5.00")
}
