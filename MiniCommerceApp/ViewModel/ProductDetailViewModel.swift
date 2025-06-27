//
//  ProductDetailViewModel.swift
//  MiniCommerceApp
//
//  Created by Mohit Gupta on 27/06/25.
//

import Foundation

@MainActor
final class ProductDetailViewModel: ObservableObject {
    let product: Product

    init(product: Product) {
        self.product = product
    }
}
