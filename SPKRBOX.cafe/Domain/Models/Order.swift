//
//  Order.swift
//  SPKRBOX.cafe
//
//  Created by Mars on 10/15/26.
//

import Foundation

struct Order: Identifiable {
    let id = UUID()
    let customerName: String
    let orderNumber: Int = Int.random(in: 100...999)
    let items: [CartItem]
    let subtotal: Double
    let taxAmount: Double
    let totalAmount: Double
    let orderDate = Date()
}
