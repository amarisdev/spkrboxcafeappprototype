//
//  CartManager.swift
//  SPKRBOX.cafe
//
//  Created by Mars on 10/15/26.
//
import SwiftUI
import Observation

protocol CartManagerType {
    var orderName: String { get set }
    var lastOrderNumber: String { get set }
    var items: [CartItem] { get }
    var subtotalSum: Double { get }
    var taxAndFees: Double { get }
    var grandTotal: Double { get }
    
    func removeItem(_ item: CartItem)
    func deleteItems(at offsets: IndexSet)
    func addItem(item: MenuItem, quantity: Int, milk: String, requests: String, time: String, subtotal: Double)
    func clear()
}

@Observable
class CartManager: CartManagerType {
    var orderName: String = "John S."
    var lastOrderNumber: String = "#9,616"
    var items: [CartItem] = []
    
    var subtotalSum: Double {
        items.reduce(0) { $0 + $1.subtotal }
    }
    
    var taxAndFees: Double {
        subtotalSum * 0.06
    }
    
    var grandTotal: Double {
        subtotalSum + taxAndFees
    }
        
    init() {}
    
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
    
    func clear() {
        items.removeAll()
    }
}
