# ☕ SPKRBOX Cafe App (iOS Prototype)

An iOS mobile ordering application prototype designed and developed for **SPKRBOX Cafe**, a vibrant independent coffee shop, bar, and music venue located in downtown Detroit, Michigan.

This project showcases a modern, high-performance SwiftUI application built using Swift's `@Observable` architecture, tailored brand aesthetics, item customization, and a streamlined pickup workflow.

---

## 📸 Key Features

* **Branded Home Experience (`CoffeeShopHomeScreen`):**
  * Custom header featuring the official SPKRBOX logo and cart navigation icon.
  * Welcome greeting stylized in Snell Roundhand script with signature burgundy palette (`Color(red: 0.5, green: 0.0, blue: 0.13)`).
  * 3x2 featured menu items grid with quick tap-to-customize navigation.
  * Reorder highlights ("Order Again") and seasonal promo banners ("Limited Time Only").

* **Item Customization (`ItemDetailView`):**
  * Interactive quantity selector with dynamic price updating.
  * Milk selection picker restricted specifically to **Whole Milk**, **Almond Milk**, and **Oat Milk**.
  * Direct flow transition from "Add to Order" straight into `CartView`.

* **Cart & Scheduling (`CartView`):**
  * Swipe-to-delete cart item management.
  * Customer name entry field.
  * Flexible pickup time selector spanning **ASAP** and **9:00 AM to 2:00 AM** (30-minute intervals) to support late-night cafe/venue operating hours.
  * Itemized breakdown displaying Subtotal, Michigan Sales Tax & Fees (6%), and Grand Total.

* **Order Confirmation (`OrderConfirmationView`):**
  * Success confirmation banner personalized with the customer's name.
  * Monospaced random order number generation.
  * Full itemized order receipt displaying items, subtotal, 6% tax breakdown, and total paid.
  * One-tap "Back to Home" order reset clearing the active session.

---

## 🛠 Tech Stack & Requirements

| Specification | Details |
| :--- | :--- |
| **Language** | Swift 5.9+ |
| **UI Framework** | SwiftUI |
| **State Management** | `@Observable` Macro (`CartManager`) |
| **Target OS** | iOS 17.0+ |
| **IDE** | Xcode 15.0+ |

---

## 🎨 Design System & Theme Specs

```swift
struct SpkrboxTheme {
    static let primaryOrange = Color(red: 1.0, green: 0.38, blue: 0.0)
    static let deepBurgundy = Color(red: 0.5, green: 0.0, blue: 0.13)
    static let creamBackground = Color(red: 0.98, green: 0.96, blue: 0.92)
    static let darkWood = Color(red: 0.2, green: 0.15, blue: 0.1)
}
