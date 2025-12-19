//
//  LikeCounterView.swift
//  Joiefull
//
//  Created by Renaud Leroy on 05/12/2025.
//

import SwiftUI

struct LikeCounterView: View {
    
    @State private var isLiked: Bool = false
    
    let clothing: Clothing
    
    private var displayedLikes: Int {
        clothing.likes + (isLiked ? 1 : 0)
    }
    
    var body: some View {
        HStack(spacing: 2) {
            Button {
                isLiked.toggle()
            } label: {
                Image(systemName: isLiked ? "heart.fill" : "heart")
            }
            Text("\(displayedLikes)")
        }
        .font(.subheadline.weight(.semibold))
        .padding(6)
        .background(Color(.white))
        .clipShape(Capsule())
        .foregroundStyle(Color(.black))
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("\(displayedLikes) mentions j’aime"))
        .accessibilityHint(Text(isLiked ? "Retirer des favoris" : "Ajouter aux favoris"))
        .onChange(of: clothing.id) {
            isLiked = false
        }
    }
}


