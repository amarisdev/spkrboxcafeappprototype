//
//  OrderConfirmationView.swift
//  SPKRBOX.cafe
//
//  Created by Mars on 10/15/26.
//

import SwiftUI

struct OrderConfirmationView: View {
    @Environment(CartManager.self) var cartManager
    @Environment(\.presentationMode) var presentationMode
    
    let orangeBg = Color(red: 1.0, green: 0.38, blue: 0.0)
    
    var body: some View {
        ZStack {
            orangeBg.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 24) {
                    // Success Icon
                    VStack(spacing: 12) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 70))
                            .foregroundColor(.white)
                        
                        Text("ORDER CONFIRMED!")
                            .font(.system(size: 26, weight: .black))
                            .foregroundColor(.white)
                        
                        Text("Thank you, \(cartManager.orderName)!")
                            .font(.headline)
                            .foregroundColor(.white.opacity(0.9))
                    }
                    .padding(.top, 40)
                    
                    // Order Number Card
                    VStack(spacing: 8) {
                        Text("ORDER NUMBER")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.secondary)
                        
                        Text(cartManager.lastOrderNumber)
                            .font(.system(size: 36, weight: .black, design: .monospaced))
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(16)
                    .padding(.horizontal)
                    
                    // Ordered Items Summary & Pricing
                    VStack(alignment: .leading, spacing: 12) {
                        Text("ORDER SUMMARY")
                            .font(.system(size: 16, weight: .black))
                            .foregroundColor(.white)
                        
                        VStack(spacing: 12) {
                            ForEach(cartManager.items) { cartItem in
                                HStack {
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(cartItem.menuItem.name)
                                            .font(.headline)
                                            .bold()
                                        Text("Milk: \(cartItem.selectedMilk) | Qty: \(cartItem.quantity)")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                    
                                    Spacer()
                                    
                                    Text(String(format: "$%.2f", cartItem.subtotal))
                                        .font(.headline)
                                }
                                Divider()
                            }
                            
                            // Subtotal Row
                            HStack {
                                Text("Subtotal")
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text(String(format: "$%.2f", cartManager.subtotalSum))
                                    .foregroundColor(.secondary)
                            }
                            
                            // Tax & Fees Row
                            HStack {
                                Text("Tax & Fees (6%)")
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text(String(format: "$%.2f", cartManager.taxAndFees))
                                    .foregroundColor(.secondary)
                            }
                            
                            Divider()
                            
                            // Total Paid Row
                            HStack {
                                Text("Total Paid")
                                    .font(.title3)
                                    .bold()
                                Spacer()
                                Text(String(format: "$%.2f", cartManager.grandTotal))
                                    .font(.title3)
                                    .bold()
                            }
                            .padding(.top, 4)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(16)
                    }
                    .padding(.horizontal)
                    
                    // Back to Home / Clear Cart
                    Button(action: {
                        cartManager.clear()
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("BACK TO HOME")
                            .font(.system(size: 18, weight: .black))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 30)
                }
            }
        }
        .navigationBarHidden(true)
    }
}
