//
//  MiniCommerceAppTests.swift
//  MiniCommerceAppTests
//
//  Created by Mohit Gupta on 27/06/25.
//

import XCTest
@testable import MiniCommerceApp

// A mock conforming to APIServiceProtocol for testing
final class MockAPIService: APIServiceProtocol {
    var productsToReturn: [Product] = []
    var errorToThrow: Error?

    func fetchProducts() async throws -> [Product] {
        if let error = errorToThrow {
            throw error
        }
        return productsToReturn
    }
}

final class ProductListViewModelTests: XCTestCase {
    func testFetchProducts_success() async {
        // Arrange
        let mockService = MockAPIService()
        mockService.productsToReturn = [
            Product(id: 1, title: "Test", price: 10.0, description: "Desc", category: "Cat", image: "img", rating: .init(rate: 4.0, count: 5))
        ]
        let viewModel = await ProductListViewModel(apiService: mockService)

        // Act
        await viewModel.fetchProducts()

        // Assert
        await MainActor.run {
            XCTAssertEqual(viewModel.products.count, 1)
            XCTAssertNil(viewModel.errorMessage)
        }
    }

    func testFetchProducts_failure() async {
        // Arrange
        let mockService = MockAPIService()
        mockService.errorToThrow = URLError(.badServerResponse)
        let viewModel = await ProductListViewModel(apiService: mockService)

        // Act
        await viewModel.fetchProducts()

        // Assert
        await MainActor.run {
            XCTAssertTrue(viewModel.products.isEmpty)
            XCTAssertNotNil(viewModel.errorMessage)
        }
    }
}
