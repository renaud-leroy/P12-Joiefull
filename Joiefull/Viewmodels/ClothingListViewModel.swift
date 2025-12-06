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
    func loadClothing() async {
        do {
            let result = try await service.fetchClothes()
            clothes = result
        } catch {
            errorMessage = "Erreur de chargement"
        }
    } 
}
