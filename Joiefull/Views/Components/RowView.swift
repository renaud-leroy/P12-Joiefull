//
//  RowView.swift
//  Joiefull
//
//  Created by Renaud Leroy on 04/12/2025.
//

import SwiftUI

struct RowView: View {
    
    let clothing: Clothing
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                ClothingPictureView(clothing: clothing)
                    .frame(maxWidth: 198, maxHeight: 198)
                    .cornerRadius(20)
                LikeCounterView(clothing: clothing)
                    .padding(.bottom, 12)
                    .padding(.trailing, 12)
            }
            PriceView(clothing: clothing)
                .padding(.horizontal, 8)
        }
        .frame(maxWidth: 198)
    }
}


#Preview {
    let picture = Picture(url: "imagemock", description: "Pull vert forêt à motif torsadé élégant, tricot finement travaillé avec manches bouffantes et col montant; doux et chaleureux.")
    let clothing = Clothing(id: 1, picture: picture, name: "Pull torsadé", category: "Bas", likes: 56, price: 69.0, original_price: 95.0)
    
    RowView(clothing: clothing)
}

