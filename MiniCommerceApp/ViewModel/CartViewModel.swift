//
//  CartViewModel.swift
//  MiniCommerceApp
//
//  Created by Mohit Gupta on 27/06/25.
//

import Foundation
import Combine

@MainActor
final class CartViewModel: ObservableObject {
    @Published private(set) var items: [CartItem] = []

    private let persistenceKey = "CartItems"

    init() {
        loadFromPersistence()
    }

    func addToCart(product: Product) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].quantity += 1
        } else {
            items.append(CartItem(id: product.id, product: product, quantity: 1))
        }
        saveToPersistence()
    }

    func removeItem(_ item: CartItem) {
        items.removeAll { $0.id == item.id }
        saveToPersistence()
    }

    func updateQuantity(for item: CartItem, quantity: Int) {
        guard let index = items.firstIndex(where: { $0.id == item.id }) else { return }
        items[index].quantity = quantity
        if items[index].quantity <= 0 {
            items.remove(at: index)
        }
        saveToPersistence()
    }

    var totalPrice: Double {
        items.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }
    }

    private func saveToPersistence() {
        if let data = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(data, forKey: persistenceKey)
        }
    }

    private func loadFromPersistence() {
        guard let data = UserDefaults.standard.data(forKey: persistenceKey),
              let savedItems = try? JSONDecoder().decode([CartItem].self, from: data) else {
            return
        }
        items = savedItems
    }
}
