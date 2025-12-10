//
//  ClothingDetailView.swift
//  Joiefull
//
//  Created by Renaud Leroy on 05/12/2025.
//

import SwiftUI

struct ClothingDetailView: View {
    
    let clothing: Clothing
    
    var body: some View {
        VStack(alignment: .leading) {
                ClothingPictureView(clothing: clothing)
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 420)
                    .cornerRadius(20)
                    .overlay(alignment: .topTrailing) {
                        ShareButtonView()
                            .padding(20)
                    }
                    .overlay(alignment: .bottomTrailing) {
                        LikeCounterView(clothing: clothing)
                            .padding(20)
                            .scaleEffect(1.2)
                    }
            
            PriceView(clothing: clothing)
                .padding(.vertical, 10)
                .font(.system(size: 16))
            Text(clothing.picture.description)
                .font(.system(size: 14, weight: .regular))
            HStack {
                RatingView()
                Spacer()
            }
            .padding(.vertical)
            TextField("Partagez ici vos impressions sur cette pièce", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

#Preview {
    let picture = Picture(url: "imagemock", description: "Pull vert forêt à motif torsadé élégant, tricot finement travaillé avec manches bouffantes et col montant; doux et chaleureux.")
    let clothing = Clothing(id: 1, picture: picture, name: "Pull torsadé", category: .tops, likes: 56, price: 69.0, original_price: 95.0)
    
    ClothingDetailView(clothing: clothing)
}
