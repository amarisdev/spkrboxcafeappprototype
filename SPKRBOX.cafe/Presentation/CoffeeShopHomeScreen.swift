//
//  CoffeeShopHomeScreen.swift
//  MyApp
//
//  Created by Mars on 9/23/26.
//
import SwiftUI

struct CoffeeShopHomeScreen<T>: View where T: CartManagerType {
    var cartManager: T
    @Environment(Router.self) var router
    
    let orangeBg = Color(red: 1.0, green: 0.38, blue: 0.0)
    let burgundy = Color(red: 0.5, green: 0.0, blue: 0.13)
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                
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
                    
                    Button {
                        router.navigate(to: .allItemsView)
                    } label: {
                        Text("See All")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.brown)
                            .cornerRadius(12)
                    }
                    .buttonStyle(.plain)
                }
                .padding(.horizontal)
                
                // Menu Grid
                LazyVGrid(
                    columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ],
                    spacing: 14
                ) {
                    ForEach(MenuItem.sampleData.prefix(6)) { item in
                        MenuItemCard(item: item) {
                            router.navigate(to: .itemDetailsView(item: item))
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
        .toolbar {
            ToolbarItem(placement: .principal) {
                Image("spkrbox logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
            }
            
            ToolbarItem(placement: .primaryAction) {
                Button {
                    router.navigate(to: .cart)
                } label: {
                    Image(systemName: "cart.fill")
                        .foregroundColor(.white)
                        .font(.title3)
                }
                .buttonStyle(.plain)
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

#Preview {
    NavigationWrap {
        CoffeeShopHomeScreen(cartManager: MockCartManager())
    }
}
