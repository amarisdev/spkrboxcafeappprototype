//
//  CartView.swift
//  SPKRBOX.cafe
//
//  Created by Mars on 10/15/26.
//
import SwiftUI

struct CartView: View {
    @Environment(CartManager.self) var cartManager
    @Environment(\.presentationMode) var presentationMode
    
    @State private var selectedPickupTime = "ASAP"
    @State private var customerName = ""
    @State private var navigateToConfirmation = false
    
    let orangeBg = Color(red: 1.0, green: 0.38, blue: 0.0)
    
    // Time slots starting with "ASAP", followed by 9:00 AM to 2:00 AM (next day)
    let timeSlots: [String] = [
        "ASAP",
        "9:00 AM", "9:30 AM", "10:00 AM", "10:30 AM", "11:00 AM", "11:30 AM",
        "12:00 PM", "12:30 PM", "1:00 PM", "1:30 PM", "2:00 PM", "2:30 PM",
        "3:00 PM", "3:30 PM", "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM",
        "6:00 PM", "6:30 PM", "7:00 PM", "7:30 PM", "8:00 PM", "8:30 PM",
        "9:00 PM", "9:30 PM", "10:00 PM", "10:30 PM", "11:00 PM", "11:30 PM",
        "12:00 AM", "12:30 AM", "1:00 AM", "1:30 AM", "2:00 AM"
    ]
    
    var body: some View {
        ZStack {
            orangeBg.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Text("YOUR CART")
                        .font(.system(size: 22, weight: .black))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Color.clear.frame(width: 24, height: 24)
                }
                .padding()
                
                if cartManager.items.isEmpty {
                    Spacer()
                    VStack(spacing: 12) {
                        Image(systemName: "cart")
                            .font(.system(size: 60))
                            .foregroundColor(.white.opacity(0.8))
                        Text("Your cart is empty")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    Spacer()
                } else {
                    List {
                        ForEach(cartManager.items) { cartItem in
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(cartItem.menuItem.name)
                                        .font(.headline)
                                        .bold()
                                    Text("Milk: \(cartItem.selectedMilk) | Qty: \(cartItem.quantity)")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    if !cartItem.specialRequests.isEmpty {
                                        Text("Note: \(cartItem.specialRequests)")
                                            .font(.caption)
                                            .foregroundColor(.orange)
                                    }
                                }
                                
                                Spacer()
                                
                                Text(String(format: "$%.2f", cartItem.subtotal))
                                    .font(.headline)
                            }
                            .padding(.vertical, 4)
                        }
                        .onDelete(perform: cartManager.deleteItems)
                        .listRowBackground(Color.white)
                    }
                    .scrollContentBackground(.hidden)
                    .padding(.horizontal)
                    
                    // Checkout Summary Card
                    VStack(spacing: 12) {
                        // Customer Name Field
                        TextField("Your Name", text: $customerName)
                            .padding(10)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                        
                        Divider()
                        
                        // Pickup Time Selection (ASAP + 9 AM to 2 AM)
                        HStack {
                            Text("Pickup Time")
                                .font(.headline)
                                .foregroundColor(.primary)
                            
                            Spacer()
                            
                            Picker("Pickup Time", selection: $selectedPickupTime) {
                                ForEach(timeSlots, id: \.self) { time in
                                    Text(time).tag(time)
                                }
                            }
                            .pickerStyle(.menu)
                            .tint(.orange)
                        }
                        
                        Divider()
                        
                        HStack {
                            Text("Subtotal")
                            Spacer()
                            Text(String(format: "$%.2f", cartManager.subtotalSum))
                        }
                        
                        HStack {
                            Text("Tax & Fees (6%)")
                            Spacer()
                            Text(String(format: "$%.2f", cartManager.taxAndFees))
                        }
                        
                        Divider()
                        
                        HStack {
                            Text("Total")
                                .font(.title3)
                                .bold()
                            Spacer()
                            Text(String(format: "$%.2f", cartManager.grandTotal))
                                .font(.title3)
                                .bold()
                        }
                        
                        Button(action: {
                            cartManager.orderName = customerName.isEmpty ? "Guest" : customerName
                            navigateToConfirmation = true
                        }) {
                            Text("CHECKOUT NOW")
                                .font(.system(size: 18, weight: .black))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.black)
                                .cornerRadius(12)
                        }
                        .background(
                            NavigationLink(destination: OrderConfirmationView(), isActive: $navigateToConfirmation) {
                                EmptyView()
                            }
                            .hidden()
                        )
                        .padding(.top, 8)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding()
                }
            }
        }
        .navigationBarHidden(true)
    }
}
