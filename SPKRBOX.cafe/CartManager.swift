//
//  CartManager.swift
//  SPKRBOX.cafe
//
//  Created by Mars on 10/15/26.
//
import SwiftUI
import Observation

@Observable
class CartManager {
    var orderName: String = "John S."
    var lastOrderNumber: String = "#9,616"
    var items: [CartItem] = []
    
    func removeItem(_ item: CartItem) {
        items.removeAll { $0.id == item.id }
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    func addItem(item: MenuItem, quantity: Int, milk: String, requests: String, time: String, subtotal: Double) {
        let newItem = CartItem(
            menuItem: item,
            quantity: quantity,
            selectedMilk: milk,
            specialRequests: requests,
            selectedTime: time,
            subtotal: subtotal
        )
        items.append(newItem)
    }
    
    var subtotalSum: Double {
        items.reduce(0) { $0 + $1.subtotal }
    }
    
    var taxAndFees: Double {
        subtotalSum * 0.06
    }
    
    var grandTotal: Double {
        subtotalSum + taxAndFees
    }
    
    func clear() {
        items.removeAll()
    }
}
