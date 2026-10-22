//
//  Router.swift
//  SPKRBOX.cafe
//
//  Created by Shahrukh on 22/10/2026.
//   - GitHub: https://www.github.com/sharukmsd
//   - LinkedIn: https://www.linkedin.com/in/sharukmsd
//

import SwiftUI

@Observable
class Router {
    var navigationPath: NavigationPath = NavigationPath()
    
    // App deps
    var cartManager: CartManager = {
        CartManager()
    }()
    
    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
        
        case .home:
            CoffeeShopHomeScreen(cartManager: cartManager)
            
        case .cart:
            CartView(cartManager: cartManager)
            
        case .allItemsView:
            AllItemsView(cartManager: cartManager, items: MenuItem.sampleData)
            
        case .itemDetailsView(let item):
            ItemDetailView(cartManager: cartManager, item: item)
            
        case .orderConfirmationView:
            OrderConfirmationView(cartManager: cartManager)
        }
    }
    
    // MARK: Navigation
    func navigate(to route: Route) {
        navigationPath.append(route)
    }
    
    func pop() {
        if !navigationPath.isEmpty {
            navigationPath.removeLast()
        }
    }
    
    func popToRoot() {
        if !navigationPath.isEmpty {
            navigationPath.removeLast(navigationPath.count)
        }
    }
}
