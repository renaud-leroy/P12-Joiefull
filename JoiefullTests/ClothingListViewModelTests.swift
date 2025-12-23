//
//  ClothingListViewModelTests.swift
//  JoiefullTests
//
//  Created by Renaud Leroy on 18/12/2025.
//

import XCTest
@testable import Joiefull

@MainActor
final class ClothingListViewModelTests: XCTestCase {

    func test_loadClothes_whenCalled_thenClothesAreLoaded() async {
        // GIVEN
        let mockPicture = Picture(url: "imagemock", description: "Pull vert forêt à motif torsadé élégant, tricot finement travaillé avec manches bouffantes et col montant; doux et chaleureux.")
        let mockClothes = [
            Clothing(id: 1, picture: mockPicture, name: "Pull torsadé", category: .tops, likes: 56, price: 69.0, original_price: 95.0)
        ]
        
        let mockService = MockClothingService(mockResult: .success(mockClothes))
        
        let vm = ClothingListViewModel(service: mockService)
        
        // WHEN
        await vm.loadClothes()
        
        // THEN
        XCTAssertEqual(vm.clothes.count, 1)
        XCTAssertNil(vm.errorMessage)
    }
    
    func test_loadClothes_whenServiceFails_thenErrorIsShown() async {
        // GIVEN
        let mockService = MockClothingService(mockResult: .failure(URLError(.badServerResponse)))
        
        let vm = ClothingListViewModel(service: mockService)
        
        // WHEN
        await vm.loadClothes()
        
        // THEN
        XCTAssertEqual(vm.clothes.count, 0)
        XCTAssertNotNil(vm.errorMessage)
        XCTAssertEqual(vm.errorMessage, "Erreur de chargement")
        
    }
    
    func testGivenEmptyQuery_WhenSearchingClothes_ThenReturnsAllClothesForCategory() async {
        // GIVEN
        let picture = Picture(url: "imagemock", description: "Pull vert forêt à motif torsadé élégant, tricot finement travaillé avec manches bouffantes et col montant; doux et chaleureux.")
        let mockService = MockClothingService(mockResult: .success([
            Clothing(id: 1, picture: picture, name: "Pull vert", category: .tops, likes: 10, price: 50, original_price: 60),
            Clothing(id: 2, picture: picture, name: "Jean bleu", category: .bottoms, likes: 5, price: 70, original_price: 80),
            Clothing(id: 3, picture: picture, name: "Pull rouge", category: .tops, likes: 3, price: 55, original_price: 65)
        ]))

        let vm = ClothingListViewModel(service: mockService)
        await vm.loadClothes()

        // WHEN
        let result = vm.searchedClothes(for: .tops, query: "")

        // THEN
        XCTAssertEqual(result.count, 2)
        XCTAssertTrue(result.allSatisfy { $0.category == .tops })
    }
    
    func testGivenQueryPull_WhenSearchingClothes_ThenReturnsMatchingClothesInCategory() async {
        // GIVEN
        let picture = Picture(url: "imagemock", description: "Pull vert forêt à motif torsadé élégant, tricot finement travaillé avec manches bouffantes et col montant; doux et chaleureux.")
        let mockService = MockClothingService(mockResult: .success([
            Clothing(id: 1, picture: picture, name: "Pull vert", category: .tops, likes: 10, price: 50, original_price: 60),
            Clothing(id: 2, picture: picture, name: "Jean bleu", category: .bottoms, likes: 5, price: 70, original_price: 80),
            Clothing(id: 3, picture: picture, name: "Pull rouge", category: .tops, likes: 3, price: 55, original_price: 65)
        ]))

        let vm = ClothingListViewModel(service: mockService)
        await vm.loadClothes()

        // WHEN
        let result = vm.searchedClothes(for: .tops, query: "pull")

        // THEN
        XCTAssertEqual(result.count, 2)
        XCTAssertTrue(result.allSatisfy {
            $0.name.localizedCaseInsensitiveContains("pull")
        })
    }
}
