import SwiftUI

@main
struct MyApp: App {
    @State private var router = Router()

    var body: some Scene {
        WindowGroup {
            NavigationWrap {
                router.view(for: .home)
            }
        }
    }
}

struct NavigationWrap<T>: View where T: View {
    let view: T
    @State private var router = Router()

    init(@ViewBuilder view: () -> T) {
        self.view = view()
    }
    
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            view
                .navigationDestination(for: Route.self) { route in
                    router.view(for: route)
                }
        }
        .environment(router)
    }
}
