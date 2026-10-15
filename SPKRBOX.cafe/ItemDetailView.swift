//
//  ItemsDetailView.swift
//  SPKRBOX.cafe
//
//  Created by Mars on 10/15/26.
//
import SwiftUI

struct ItemDetailView: View {
    let item: MenuItem
    @Environment(CartManager.self) var cartManager
    @Environment(\.presentationMode) var presentationMode
    @State private var quantity = 1
    @State private var selectedMilk = "Whole Milk"
    @State private var specialRequests = ""
    @State private var navigateToCart = false
    
    let milkOptions = ["Whole Milk", "Almond Milk", "Oat Milk"]
    
    var body: some View {
        ZStack {
            SpkrboxTheme.creamBackground
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Image(item.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .clipped()
                            .cornerRadius(16)
                            .shadow(radius: 5)
                        
                        HStack {
                            Text(item.name)
                                .font(.title)
                                .bold()
                                .foregroundColor(SpkrboxTheme.darkWood)
                            Spacer()
                            Text(String(format: "$%.2f", item.price))
                                .font(.title2)
                                .bold()
                                .foregroundColor(SpkrboxTheme.primaryRed)
                        }
                        
                        Text(item.description)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .lineSpacing(4)
                        
                        // Milk Selection
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Milk Choice")
                                .font(.headline)
                                .foregroundColor(SpkrboxTheme.darkWood)
                            
                            Picker("Milk Choice", selection: $selectedMilk) {
                                ForEach(milkOptions, id: \.self) { milk in
                                    Text(milk).tag(milk)
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        
                        // Quantity Selection
                        HStack {
                            Text("Quantity")
                                .font(.headline)
                                .foregroundColor(SpkrboxTheme.darkWood)
                            
                            Spacer()
                            
                            HStack(spacing: 16) {
                                Button(action: { if quantity > 1 { quantity -= 1 } }) {
                                    Image(systemName: "minus.circle.fill")
                                        .font(.title2)
                                        .foregroundColor(quantity > 1 ? SpkrboxTheme.warmOrange : .gray)
                                }
                                
                                Text("\(quantity)")
                                    .font(.title3)
                                    .bold()
                                    .frame(minWidth: 30)
                                
                                Button(action: { quantity += 1 }) {
                                    Image(systemName: "plus.circle.fill")
                                        .font(.title2)
                                        .foregroundColor(SpkrboxTheme.warmOrange)
                                }
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                    }
                    .padding()
                }
                
                // Add to Order Button (triggers transition to CartView)
                Button(action: {
                    let itemSubtotal = item.price * Double(quantity)
                    cartManager.addItem(
                        item: item,
                        quantity: quantity,
                        milk: selectedMilk,
                        requests: specialRequests,
                        time: "ASAP",
                        subtotal: itemSubtotal
                    )
                    navigateToCart = true
                }) {
                    HStack {
                        Text("Add to Order")
                        Spacer()
                        Text(String(format: "$%.2f", item.price * Double(quantity)))
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(SpkrboxTheme.primaryRed)
                    .cornerRadius(12)
                    .padding()
                }
                .background(
                    NavigationLink(destination: CartView(), isActive: $navigateToCart) {
                        EmptyView()
                    }
                    .hidden()
                )
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
