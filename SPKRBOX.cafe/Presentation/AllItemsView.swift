//
//  AllItemsView.swift
//  SPKRBOX.cafe
//
//  Created by Mars on 10/15/26.
//

import SwiftUI

struct AllItemsView<T>: View where T: CartManagerType {
    var cartManager: T
    @Environment(Router.self) var router

    let items: [MenuItem]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(items) { item in
                    Button {
                        router.navigate(to: .itemDetailsView(item: item))
                    } label: {
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
                    .buttonStyle(.plain)
                }
            }
            .padding()
        }
        .navigationTitle("Full Menu")
        .navigationBarTitleDisplayMode(.inline)
        .background {
            SpkrboxTheme.creamBackground.ignoresSafeArea()
        }
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(SpkrboxTheme.creamBackground, for: .navigationBar)
        
    }
}

#Preview {
    NavigationWrap {
        AllItemsView(
            cartManager: MockCartManager(),
            items: MenuItem.sampleData
        )
    }
}
