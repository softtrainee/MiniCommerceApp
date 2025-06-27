//
//  APIService.swift
//  MiniCommerceApp
//
//  Created by Mohit Gupta on 27/06/25.
//

import Foundation

protocol APIServiceProtocol {
    func fetchProducts() async throws -> [Product]
}

final class APIService: APIServiceProtocol {
    private let baseURL = "https://fakestoreapi.com"

    func fetchProducts() async throws -> [Product] {
        guard let url = URL(string: "\(baseURL)/products") else {
            throw URLError(.badURL)
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([Product].self, from: data)
    }
}
