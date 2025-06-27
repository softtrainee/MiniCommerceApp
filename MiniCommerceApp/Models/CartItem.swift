//
//  CartItem.swift
//  MiniCommerceApp
//
//  Created by Mohit Gupta on 27/06/25.
//

import Foundation

struct CartItem: Identifiable, Codable, Equatable {
    let id: Int
    let product: Product
    var quantity: Int
}
