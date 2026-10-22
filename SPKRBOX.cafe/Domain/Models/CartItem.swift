//
//  CartItem.swift
//  SPKRBOX.cafe
//
//  Created by Mars on 10/15/26.
//
import Foundation

struct CartItem: Identifiable, Equatable, Hashable {
    let id = UUID()
    let menuItem: MenuItem
    var quantity: Int
    let selectedMilk: String
    let specialRequests: String
    let selectedTime: String
    let subtotal: Double
}

extension CartItem {
    static let mockItems: [CartItem] = [
        CartItem(
            menuItem: MenuItem.sampleData[0],
            quantity: 2,
            selectedMilk: "Oat Milk",
            specialRequests: "Extra hot, no sugar",
            selectedTime: "ASAP",
            subtotal: 9.00
        ),
        CartItem(
            menuItem: MenuItem.sampleData[1],
            quantity: 1,
            selectedMilk: "Whole Milk",
            specialRequests: "Extra shot",
            selectedTime: "10:30 AM",
            subtotal: 5.50
        ),
        CartItem(
            menuItem: MenuItem.sampleData[2],
            quantity: 3,
            selectedMilk: "Almond Milk",
            specialRequests: "No whipped cream",
            selectedTime: "11:00 AM",
            subtotal: 15.75
        )
    ]
}
