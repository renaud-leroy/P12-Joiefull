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
        GeometryReader { geo in
            VStack {
                ClothingPictureView(clothing: clothing)
                    .scaledToFill()
                    .frame(height: geo.size.height * 0.66)
                    .frame(maxWidth: .infinity)
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
                VStack(alignment: .leading, spacing: 20) {
                    PriceView(clothing: clothing)
                        .font(.system(size: 16))
                    Text(clothing.picture.description)
                        .font(.system(size: 14, weight: .regular))
                    HStack {
                        RatingView()
                        Spacer()
                    }
                    TextField("Partagez ici vos impressions sur cette pièce", text: .constant(""))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.vertical)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    let picture = Picture(url: "imagemock", description: "Pull vert forêt à motif torsadé élégant, tricot finement travaillé avec manches bouffantes et col montant; doux et chaleureux.")
    let clothing = Clothing(id: 1, picture: picture, name: "Pull torsadé", category: .tops, likes: 56, price: 69.0, original_price: 95.0)
    
    ClothingDetailView(clothing: clothing)
}
