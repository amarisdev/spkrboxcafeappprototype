//
//  MenuItem.swift
//  SPKRBOX.cafe
//
//  Created by Mars on 10/15/26.
//

import Foundation

struct MenuItem: Identifiable, Hashable, Equatable {
    let id = UUID()
    let name: String
    let category: MenuCategory
    let price: Double
    let description: String
    let imageName: String // Name of your asset in Assets.xcassets
    
    enum MenuCategory: String, CaseIterable, Identifiable {
        var id: String { self.rawValue }
        case espresso = "Espresso & Coffee"
        case signature = "Signature Drinks"
        case cold = "Cold Brews"
        case tea = "Tea & Matcha"
    }
}

// Sample Data based on your Spkrbox Menu
extension MenuItem {
    static let sampleData: [MenuItem] = [
        MenuItem(
            name: "Flat White",
            category: .espresso,
            price: 4.75,
            description: "Smooth espresso with velvet microfoam poured into a retro ceramic cup.",
            imageName: "flat_white"
        ),
        MenuItem(
            name: "Regular Coffee",
            category: .espresso,
            price: 3.25,
            description: "Classic dark roast drip coffee served hot.",
            imageName: "regular_coffee"
        ),
        MenuItem(
            name: "Cappuccino",
            category: .espresso,
            price: 4.50,
            description: "Rich espresso topped with a thick layer of frothed milk foam.",
            imageName: "cappuccino"
        ),
        MenuItem(
            name: "Chai Latte",
            category: .tea,
            price: 5.25,
            description: "Spiced black tea blended with steamed milk and cinnamon dusting.",
            imageName: "chai_latte"
        ),
        MenuItem(
            name: "Cold Brew",
            category: .cold,
            price: 4.75,
            description: "Slow-steeped smooth iced coffee served in a signature glass.",
            imageName: "cold_brew"
        ),
        MenuItem(
            name: "El Duderino",
            category: .signature,
            price: 6.50,
            description: "A White Russian inspired cold coffee layered with cream. The Dude abides.",
            imageName: "el_duderino"
        ),
        MenuItem(
            name: "Espresso Martini",
            category: .signature,
            price: 7.00,
            description: "Bold espresso shaken chilled with a rich cremma layer.",
            imageName: "espresso_martini"
        ),
        MenuItem(
            name: "Green Fairy Latte",
            category: .tea,
            price: 5.75,
            description: "Magical herbal green tea latte with star-patterned foam artwork.",
            imageName: "green_fairy_latte"
        ),
        MenuItem(
            name: "Irish Coffee",
            category: .signature,
            price: 6.75,
            description: "Hot coffee with whiskey flavor and topped with thick cream.",
            imageName: "irish_coffee"
        ),
        MenuItem(
            name: "Latte",
            category: .espresso,
            price: 4.75,
            description: "Espresso with silky steamed milk and subtle latte art.",
            imageName: "latte"
        ),
        MenuItem(
            name: "Matcha Latte",
            category: .tea,
            price: 5.50,
            description: "Premium ceremonial green tea whisked and layered with steamed milk.",
            imageName: "matcha_latte"
        ),
        MenuItem(
            name: "Nitro Cold Brew",
            category: .cold,
            price: 5.25,
            description: "Infused with nitrogen for a creamy, stout-like head and ultra-smooth taste.",
            imageName: "nitro_cold_brew"
        ),
        MenuItem(
            name: "Nervous Negroni",
            category: .signature,
            price: 7.25,
            description: "Bold espresso cocktail infusion served over a large ice sphere with orange peel twist.",
            imageName: "nervous_negroni"
        ),
        MenuItem(
            name: "Pure Evil Latte",
            category: .signature,
            price: 6.00,
            description: "Dark cocoa espresso latte featuring skull latte art poured in a matte black mug.",
            imageName: "pure_evil_latte"
        )
    ]
}
