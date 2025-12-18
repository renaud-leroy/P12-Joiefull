//
//  ClothingPictureView.swift
//  Joiefull
//
//  Created by Renaud Leroy on 05/12/2025.
//

import SwiftUI

struct ClothingPictureView: View {
    
    let clothing: Clothing
    var isSelected: Bool = false
    
    var body: some View {
#if DEBUG && targetEnvironment(simulator)
        Image("Imagemock")
            .resizable()
        //            .frame(maxWidth: .infinity)
            .scaledToFill()
            .clipped()
        //            .cornerRadius(20)
#else
        AsyncImage(url: URL(string: clothing.picture.url)) { image in
            image
                .resizable()
                .scaledToFill()
                .clipped()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(
                            isSelected ? Color.accentColor : .clear,
                            lineWidth: 2
                        )
                )
        } placeholder: {
            ProgressView()
        }
#endif
    }
    
}

#Preview {
    let picture = Picture(url: "imagemock", description: "Pull vert forêt à motif torsadé élégant, tricot finement travaillé avec manches bouffantes et col montant; doux et chaleureux.")
    let clothing = Clothing(id: 1, picture: picture, name: "Pull torsadé", category: .tops, likes: 56, price: 69.0, original_price: 95.0)
    
    ClothingPictureView(clothing: clothing)
}
