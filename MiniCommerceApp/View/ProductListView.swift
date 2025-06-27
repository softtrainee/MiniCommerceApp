//
//  ProductListView.swift
//  MiniCommerceApp
//
//  Created by Mohit Gupta on 27/06/25.
//

import SwiftUI

struct ProductListView: View {
    @StateObject private var viewModel = ProductListViewModel()
    @EnvironmentObject var cartVM: CartViewModel

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                } else {
                    List(viewModel.products) { product in
                        NavigationLink(destination: ProductDetailView(product: product)
                            .environmentObject(cartVM)
                        ) {
                            ProductRowView(product: product)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Products")
            .toolbar {
                NavigationLink(destination: CartView().environmentObject(cartVM)) {
                    HStack {
                        Image(systemName: "cart")
                        if cartVM.items.count > 0 {
                            Text("\(cartVM.items.count)")
                                .font(.caption)
                                .padding(4)
                                .background(Color.blue.opacity(0.8))
                                .clipShape(Circle())
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
        .task {
            await viewModel.fetchProducts()
        }
    }
}
