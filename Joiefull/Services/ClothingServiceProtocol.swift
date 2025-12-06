//
//  ClothingServiceProtocol.swift
//  Joiefull
//
//  Created by Renaud Leroy on 04/12/2025.
//

import Foundation

protocol ClothingServiceProtocol {
    func fetchClothes() async throws -> [Clothing]
}
