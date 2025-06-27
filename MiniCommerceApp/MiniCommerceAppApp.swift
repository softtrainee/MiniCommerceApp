//
//  MiniCommerceAppApp.swift
//  MiniCommerceApp
//
//  Created by Mohit Gupta on 27/06/25.
//

import SwiftUI

@main
struct MiniCommerceApp: App {
    @StateObject private var cartVM = CartViewModel()

    var body: some Scene {
        WindowGroup {
            ProductListView()
                .environmentObject(cartVM)
        }
    }
}
