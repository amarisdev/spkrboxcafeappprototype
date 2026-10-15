//
//  AllItemsView.swift
//  SPKRBOX.cafe
//
//  Created by Mars on 10/15/26.
//

import SwiftUI

struct AllItemsView: View {
    let items: [MenuItem]
    @Environment(CartManager.self) var cartManager
    
    var body: some View {
        ZStack {
            SpkrboxTheme.creamBackground.ignoresSafeArea()
            
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(items) { item in
                        NavigationLink(destination: ItemDetailView(item: item)) {
                            HStack(spacing: 16) {
                                Image(item.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(12)
                                    .clipped()
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(item.name)
                                        .font(.headline)
                                        .foregroundColor(SpkrboxTheme.darkWood)
                                    Text(item.description)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                        .lineLimit(2)
                                    Text(String(format: "$%.2f", item.price))
                                        .font(.subheadline)
                                        .bold()
                                        .foregroundColor(SpkrboxTheme.primaryRed)
                                }
                                
                                Spacer()
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(16)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Full Menu")
        .navigationBarTitleDisplayMode(.inline)
    }
}
