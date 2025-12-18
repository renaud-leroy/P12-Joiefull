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
}
