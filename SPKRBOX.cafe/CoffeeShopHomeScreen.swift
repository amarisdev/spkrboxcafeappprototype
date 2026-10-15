//
//  CoffeeShopHomeScreen.swift
//  MyApp
//
//  Created by Mars on 9/23/26.
//
import SwiftUI

struct CoffeeShopHomeScreen: View {
    @Environment(CartManager.self) var cartManager
    
    let orangeBg = Color(red: 1.0, green: 0.38, blue: 0.0)
    let burgundy = Color(red: 0.5, green: 0.0, blue: 0.13)
    
    var body: some View {
        NavigationView {
            ZStack {
                orangeBg.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        // Header Logo & Cart Icon
                        HStack {
                            Spacer()
                            Image("spkrbox logo") // Ensure this matches your asset catalog name exactly
                                .resizable()
                                .scaledToFit()
                                .frame(width: 65, height: 65)
                                .clipShape(Circle())
                            Spacer()
                        }
                        .overlay(
                            NavigationLink(destination: CartView()) {
                                ZStack {
                                    Circle()
                                        .fill(Color.orange.opacity(0.8))
                                        .frame(width: 44, height: 44)
                                    Image(systemName: "cart.fill")
                                        .foregroundColor(.white)
                                        .font(.title3)
                                }
                            }
                            .padding(.trailing, 20),
                            alignment: .trailing
                        )
                        
                        Text("SPKRBOX DETROIT")
                            .font(.custom("Futura", size: 40))
                            .foregroundColor(.white)
                            .bold()
                        
                        Text("Welcome Back User!")
                            .font(.custom("Snell Roundhand", size: 35))
                            .italic()
                            .foregroundColor(burgundy)
                            .bold()
                        
                        Rectangle()
                            .fill(Color.white)
                            .frame(height: 2)
                            .padding(.horizontal)
                        
                        // Featured Section
                        HStack {
                            Text("FEATURED ITEMS")
                                .font(.system(size: 20, weight: .black))
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            NavigationLink(destination: AllItemsView(items: MenuItem.sampleData)) {
                                Text("See All")
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(Color.brown)
                                    .cornerRadius(12)
                            }
                        }
                        .padding(.horizontal)
                        
                        // Menu Grid
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 14) {
                            ForEach(MenuItem.sampleData.prefix(6)) { item in
                                NavigationLink(destination: ItemDetailView(item: item)) {
                                    MenuItemCard(item: item)
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        Rectangle()
                            .fill(Color.white)
                            .frame(height: 2)
                            .padding(.horizontal)
                        
                        // Lower Featured Banners
                        HStack(spacing: 16) {
                            VStack {
                                Text("ORDER AGAIN")
                                    .font(.system(size: 16, weight: .black))
                                    .foregroundColor(.white)
                                Image("el_duderino")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(16)
                                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white, lineWidth: 2))
                            }
                            
                            Spacer()
                            
                            VStack {
                                Text("LIMITED\nTIME ONLY")
                                    .font(.system(size: 14, weight: .black))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                Image("pure_evil_latte")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(16)
                                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white, lineWidth: 2))
                            }
                        }
                        .padding(.horizontal, 30)
                        .padding(.bottom, 30)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}
