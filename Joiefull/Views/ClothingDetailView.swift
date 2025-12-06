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
        VStack {
            ZStack {
                ClothingPictureView(clothing: clothing)
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 480)
                    .cornerRadius(20)
                    .overlay(alignment: .topTrailing) {
                        ShareButtonView()
                            .padding(20)
                    }
                    .overlay(alignment: .bottomTrailing) {
                        LikeCounterView(clothing: clothing)
                            .padding(20)
                    }
            }
            PriceView(clothing: clothing)
                .padding(.vertical, 10)
            Text(clothing.picture.description)
                .font(Font.subheadline)
            HStack {
                RatingView()
                Spacer()
            }
            .padding(10)
            
            TextField("Partagez ici vos impressions sur cette pièce", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding(.horizontal)
    }
}

#Preview {
    let picture = Picture(url: "imagemock", description: "Pull vert forêt à motif torsadé élégant, tricot finement travaillé avec manches bouffantes et col montant; doux et chaleureux.")
    let clothing = Clothing(id: 1, picture: picture, name: "Pull torsadé", category: "Bas", likes: 56, price: 69.0, original_price: 95.0)
    
    ClothingDetailView(clothing: clothing)
}
