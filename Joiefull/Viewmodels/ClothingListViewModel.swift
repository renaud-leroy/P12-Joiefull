//
//  ClothingListViewModel.swift
//  Joiefull
//
//  Created by Renaud Leroy on 05/12/2025.
//

import Foundation
import Combine

final class ClothingListViewModel: ObservableObject {
    
    @Published var errorMessage: String? = nil
    @Published var isLoading: Bool = false
    @Published var clothes: [Clothing] = []
    
    private let service: ClothingServiceProtocol
    
    init(service: ClothingServiceProtocol = ClothingService()) {
        self.service = service
    }
    
    @MainActor
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
