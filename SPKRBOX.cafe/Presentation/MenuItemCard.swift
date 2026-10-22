//
//  MenuItemCard.swift
//  MyApp
//
//  Created by Mars on 9/23/26.
//

import SwiftUI

struct MenuItemCard: View {
    let item: MenuItem
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack(spacing: 6) {
                Image(item.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(16)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white, lineWidth: 2))
                
                Text(item.name)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(height: 32)
                
                Text(String(format: "$%.2f", item.price))
                    .font(.system(size: 14, weight: .black))
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 4)
                    .background(Color(red: 0.7, green: 0.05, blue: 0.1))
                    .cornerRadius(8)
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    NavigationWrap {
        MenuItemCard(
            item: .sampleData.first!,
            action: {}
        )
    }
}
