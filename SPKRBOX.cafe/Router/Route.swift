//
//  Route.swift
//  SPKRBOX.cafe
//
//  Created by Shahrukh on 22/10/2026.
//   - GitHub: https://www.github.com/sharukmsd
//   - LinkedIn: https://www.linkedin.com/in/sharukmsd
//


enum Route: Hashable {
    case home
    case cart
    case allItemsView
    case itemDetailsView(item: MenuItem)
    case orderConfirmationView
}
