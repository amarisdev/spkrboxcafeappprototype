//
//  CartView.swift
//  SPKRBOX.cafe
//
//  Created by Mars on 10/15/26.
//
import SwiftUI

struct CartView<T>: View where T: CartManagerType {
    @State var cartManager: T
    @Environment(Router.self) var router
    
    @State private var selectedPickupTime = "ASAP"
    @State private var customerName = ""
    
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
        VStack(spacing: 0) {
            if cartManager.items.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "cart")
                        .font(.system(size: 60))
                        .foregroundColor(.white.opacity(0.8))
                    Text("Your cart is empty")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
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
                    
                    Button {
                        cartManager.orderName = customerName.isEmpty ? "Guest" : customerName
                        router.navigate(to: .orderConfirmationView)
                    } label: {
                        Text("CHECKOUT NOW")
                            .font(.system(size: 18, weight: .black))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(12)
                    }
                    .buttonStyle(.plain)
                    .padding(.top, 8)
                    
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .padding()
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("YOUR CART")
                    .font(.system(size: 22, weight: .black))
                    .foregroundColor(.white)
            }
        }
        .background {
            orangeBg.ignoresSafeArea()
        }
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(orangeBg, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
}

#Preview("Cart with Items") {
    NavigationWrap {
        CartView(cartManager: MockCartManager(items: CartItem.mockItems))
    }
}

#Preview("Cart without Items") {
    NavigationWrap {
        CartView(cartManager: MockCartManager())
    }
}
