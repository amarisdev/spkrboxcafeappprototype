//
//  CartItem.swift
//  SPKRBOX.cafe
//
//  Created by Mars on 10/15/26.
//
import Foundation

struct CartItem: Identifiable {
    let id = UUID()
    let menuItem: MenuItem
    var quantity: Int
    let selectedMilk: String
    let specialRequests: String
    let selectedTime: String
    let subtotal: Double
}
