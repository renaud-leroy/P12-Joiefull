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
        
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 8) {
                ClothingPictureView(clothing: clothing)
                    .frame(height: geo.size.height * 0.8)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(20)
                    .overlay(alignment: .bottomTrailing) {
                        LikeCounterView(clothing: clothing)
                            .padding(12)
                    }
                PriceView(clothing: clothing)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 8)
                    .font(.system(size: 13))
            }
        }
    }
}



#Preview {
    let picture = Picture(url: "Imagemock", description: "Pull vert forêt à motif torsadé élégant, tricot finement travaillé avec manches bouffantes et col montant; doux et chaleureux.")
    let clothing = Clothing(id: 1, picture: picture, name: "Pull torsadé", category: .tops, likes: 56, price: 69.0, original_price: 95.0)
    
    RowView(clothing: clothing)
}

