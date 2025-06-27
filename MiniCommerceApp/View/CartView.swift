//
//  CartView.swift
//  MiniCommerceApp
//
//  Created by Mohit Gupta on 27/06/25.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartVM: CartViewModel

    var body: some View {
        VStack {
            if cartVM.items.isEmpty {
                Spacer()
                Text("Your cart is empty")
                    .font(.headline)
                Spacer()
            } else {
                List {
                    ForEach(cartVM.items) { item in
                        HStack {
                            AsyncImage(url: URL(string: item.product.image)) { phase in
                                if let image = phase.image {
                                    image.resizable().aspectRatio(contentMode: .fit)
                                } else if phase.error != nil {
                                    Color.red
                                } else {
                                    ProgressView()
                                }
                            }
                            .frame(width: 50, height: 50)
                            .cornerRadius(6)

                            VStack(alignment: .leading) {
                                Text(item.product.title)
                                    .font(.headline)
                                    .lineLimit(1)
                                Text("$\(item.product.price, specifier: "%.2f") x \(item.quantity)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }

                            Spacer()

                            Stepper("", value: Binding(
                                get: { item.quantity },
                                set: { newVal in
                                    cartVM.updateQuantity(for: item, quantity: newVal)
                                }
                            ), in: 1...99)
                            .frame(width: 70)

                            Button(action: {
                                cartVM.removeItem(item)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
                .listStyle(PlainListStyle())
                HStack {
                    Text("Total:")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Text("$\(cartVM.totalPrice, specifier: "%.2f")")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                }
                .padding()
            }
        }
        .navigationTitle("Cart")
    }
}
