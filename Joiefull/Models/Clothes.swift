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
    let category: ClothingCategory
    let likes: Int
    let price: Double
    let original_price: Double
}

struct Picture: Codable {
    let url: String
    let description: String
}

enum ClothingCategory: String, Codable, CaseIterable {
    case accessories = "ACCESSORIES"
    case bottoms = "BOTTOMS"
    case tops = "TOPS"
    case shoes = "SHOES"
}

extension ClothingCategory: CustomStringConvertible {
    var description: String {
        switch self {
        case .tops:
            return "Hauts"
        case .bottoms:
            return "Bas"
        case .accessories:
            return "Sacs"
        case .shoes:
            return "Chaussures"
        }
    }
}

extension ClothingCategory {
    var sortKey: Int {
        switch self {
        case .tops:
            return 0
        case .bottoms:
            return 1
        case .accessories:
            return 2
        case .shoes:
            return 3
        }
    }
}
