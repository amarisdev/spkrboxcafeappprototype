import SwiftUI

@main
struct MyApp: App {
    @State private var cartManager = CartManager()

    var body: some Scene {
        WindowGroup {
            CoffeeShopHomeScreen()
                .environment(cartManager)
        }
    }
}
