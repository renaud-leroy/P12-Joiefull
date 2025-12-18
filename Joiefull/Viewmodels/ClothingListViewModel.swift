//
//  ClothingListViewModel.swift
//  Joiefull
//
//  Created by Renaud Leroy on 05/12/2025.
//

import Foundation
import Observation

@MainActor
@Observable
final class ClothingListViewModel {
    
    var errorMessage: String? = nil
    var isLoading: Bool = false
    var clothes: [Clothing] = []
    
    private let service: ClothingServiceProtocol
    
    init(service: ClothingServiceProtocol) {
        self.service = service
    }
    
    
    func loadClothes() async {
        do {
            let fetchedClothes: [Clothing] = try await service.fetchClothes()
            clothes = fetchedClothes
            print("Loaded clothes: \(fetchedClothes.count)")
        } catch {
            errorMessage = "Erreur de chargement"
        }
    }
    
    
    func filteredClothes(for category: ClothingCategory) -> [Clothing] {
        clothes.filter { $0.category == category }
    }
}
