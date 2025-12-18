//
//  MockClothingService.swift
//  JoiefullTests
//
//  Created by Renaud Leroy on 18/12/2025.
//

import Foundation
@testable import Joiefull

final class MockClothingService: ClothingServiceProtocol {
    
    var mockResult: Result<[Clothing], Error>
    
    init(mockResult: Result<[Clothing], Error>) {
        self.mockResult = mockResult
    }
    
    
    func fetchClothes() async throws -> [Clothing] {
        switch mockResult {
        case .success(let success):
            return success
        case .failure(let failure):
            throw failure
        }
    }
}
