//
//  LikeCounterView.swift
//  Joiefull
//
//  Created by Renaud Leroy on 05/12/2025.
//

import SwiftUI

struct LikeCounterView: View {
    
    let clothing: Clothing
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: "heart")
            Text("\(clothing.likes)")
        }
        .font(Font.caption.bold())
        .padding(6)
        .background(Color(.white))
        .clipShape(Capsule())
        .foregroundStyle(Color(.black))
    }
}

#Preview {
    let picture = Picture(url: "imagemock", description: "Pull vert forêt à motif torsadé élégant, tricot finement travaillé avec manches bouffantes et col montant; doux et chaleureux.")
    let clothing = Clothing(id: 1, picture: picture, name: "Pull torsadé", category: "Bas", likes: 56, price: 69.0, original_price: 95.0)
    
    LikeCounterView(clothing: clothing)
}
