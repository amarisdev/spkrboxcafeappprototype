//
//  CoffeeShopHomeScreen.swift
//  MyApp
//
//  Created by Mars on 9/23/26.
//

import SwiftUI

struct CoffeeShopHomeScreen: View {
    var body: some View {
        ZStack {
            // 1. Fullscreen background color
            Color.orange
                .ignoresSafeArea()
            // 2. Scroll container for long content
            ScrollView {
                // 3. Main vertical stack that holds all your sections
                VStack(spacing: 20) {
                    // We will put our navigation bar, banner, and grids in here!
                    // Left Icon (Menu)
                    Image ("spkrbox logo")
                        .resizable()
                        .frame(width: 60, height: 60)
                    Text("SPKRBOX")
                        .font( .custom ("Futura", size: 25))
                        .bold()
                    
                    }
                }
            }
        }
    }

#Preview {
    CoffeeShopHomeScreen()
}
