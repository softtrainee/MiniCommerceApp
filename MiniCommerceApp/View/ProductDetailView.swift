//
//  ProductDetailView.swift
//  MiniCommerceApp
//
//  Created by Mohit Gupta on 27/06/25.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @EnvironmentObject var cartVM: CartViewModel
    @State private var showAddedAlert = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: product.image)) { phase in
                    if let image = phase.image {
                        image.resizable().aspectRatio(contentMode: .fit)
                    } else if phase.error != nil {
                        Color.red
                    } else {
                        ProgressView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 300)
                .background(Color.gray.opacity(0.2))

                Text(product.title)
                    .font(.title2)
                    .fontWeight(.bold)

                Text(product.category.capitalized)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text("$\(product.price, specifier: "%.2f")")
                    .font(.title3)
                    .fontWeight(.semibold)

                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("\(product.rating.rate, specifier: "%.1f") (\(product.rating.count) reviews)")
                        .font(.subheadline)
                }

                Text(product.description)
                    .font(.body)
                    .foregroundColor(.secondary)

                Button(action: {
                    cartVM.addToCart(product: product)
                    showAddedAlert = true
                }) {
                    HStack {
                        Image(systemName: "cart.badge.plus")
                        Text("Add to Cart")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.top)
            }
            .padding()
        }
        .navigationTitle("Details")
        .alert(isPresented: $showAddedAlert) {
            Alert(title: Text("Added to Cart"), message: Text("Product added to cart."), dismissButton: .default(Text("OK")))
        }
    }
}
