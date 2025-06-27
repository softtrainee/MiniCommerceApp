//
//  Product.swift
//  MiniCommerceApp
//
//  Created by Mohit Gupta on 27/06/25.
//

import Foundation

struct Product: Identifiable, Codable, Equatable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating

    struct Rating: Codable, Equatable {
        let rate: Double
        let count: Int
    }
}
