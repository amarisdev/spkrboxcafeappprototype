//
//  MockCartManager.swift
//  SPKRBOX.cafe
//
//  Created by Shahrukh on 22/10/2026.
//   - GitHub: https://www.github.com/sharukmsd
//   - LinkedIn: https://www.linkedin.com/in/sharukmsd
//

import SwiftUI

@Observable
final class MockCartManager: CartManagerType {
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

    init(items: [CartItem] = []) {
        self.items = items
    }

    func removeItem(_ item: CartItem) {
        items.removeAll { $0.id == item.id }
    }

    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    func addItem(
        item: MenuItem,
        quantity: Int,
        milk: String,
        requests: String,
        time: String,
        subtotal: Double
    ) {
        items.append(
            CartItem(
                menuItem: item,
                quantity: quantity,
                selectedMilk: milk,
                specialRequests: requests,
                selectedTime: time,
                subtotal: subtotal
            )
        )
    }

    func clear() {
        items.removeAll()
    }
}
