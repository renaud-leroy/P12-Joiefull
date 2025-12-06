//
//  ClothingService.swift
//  Joiefull
//
//  Created by Renaud Leroy on 04/12/2025.
//

import Foundation

final class ClothingService: ClothingServiceProtocol {
    
    private let session: URLSession
    private let url: URL
    
    init(session: URLSession = .shared, url: URL = URL(string: "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/api/clothes.json")!) {
        self.session = session
        self.url = url
    }
    
    func fetchClothes() async throws -> [Clothing] {
        let (data, _) = try await session.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode([Clothing].self, from: data)
    }
}
