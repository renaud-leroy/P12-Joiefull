//
//  Clothing.swift
//  Joiefull
//
//  Created by Renaud Leroy on 04/12/2025.
//

import Foundation


struct Clothing: Codable, Identifiable {
    let id: Int
    let picture: Picture
    let name: String
    let category: String
    let likes: Int
    let price: Double
    let original_price: Double
}

struct Picture: Codable {
    let url: String
    let description: String
}

enum ClothingCategory: String, Codable {
    case accessories
    case bottoms
    case tops
    case shoes
}
