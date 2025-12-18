//
//  ClothingDetailView.swift
//  Joiefull
//
//  Created by Renaud Leroy on 05/12/2025.
//

import SwiftUI

struct ClothingDetailView: View {
    
    @Environment(\.horizontalSizeClass) private var hSizeClass
    
    let clothing: Clothing
    let shareMessage = "Regarde cet article sur Joiefull"
    
    var body: some View {
        VStack {
            VStack {
                ClothingPictureView(clothing: clothing)
                    .scaledToFill()
                    .frame(height: hSizeClass == .regular ? 700 : 400)
                    .clipped()
                    .cornerRadius(20)
                    .overlay(alignment: .topTrailing) {
                        ShareLink(item: shareMessage) {
                            ShareButtonView()
                                .padding(20)
                                .scaleEffect(1.2)
                        }
                        .accessibilityLabel(Text("Partager l’article"))                    }
                    .overlay(alignment: .bottomTrailing) {
                        LikeCounterView(clothing: clothing)
                            .padding(20)
                            .scaleEffect(1.2)
                            .accessibilityHidden(true)
                    }
            }
            .padding(.bottom)
            VStack(alignment: .leading, spacing: 20) {
                PriceView(clothing: clothing)
                    .font(.default)
                    .accessibilityLabel(
                        Text("Prix : \(Int(clothing.price)) euros")
                    )
                Text(clothing.picture.description)
                    .font(.default)
                    .accessibilityHidden(true)
                HStack {
                    RatingView(clothing: clothing)
                    Spacer()
                }
                TextField("Partagez ici vos impressions sur cette pièce", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    let picture = Picture(url: "imagemock", description: "Pull vert forêt à motif torsadé élégant, tricot finement travaillé avec manches bouffantes et col montant; doux et chaleureux.")
    let clothing = Clothing(id: 1, picture: picture, name: "Pull torsadé", category: .tops, likes: 56, price: 69.0, original_price: 95.0)
    
    ClothingDetailView(clothing: clothing)
}

