//
//  ClothingPictureView.swift
//  Joiefull
//
//  Created by Renaud Leroy on 05/12/2025.
//

import SwiftUI

struct ClothingPictureView: View {
    
    let clothing: Clothing
    
    var body: some View {
        AsyncImage(url: URL(string: clothing.picture.url)) { image in
            image
                .resizable()
//                .aspectRatio(contentMode: .fill)
                .scaledToFill()
                .clipped()
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    let picture = Picture(url: "imagemock", description: "Pull vert forêt à motif torsadé élégant, tricot finement travaillé avec manches bouffantes et col montant; doux et chaleureux.")
    let clothing = Clothing(id: 1, picture: picture, name: "Pull torsadé", category: .tops, likes: 56, price: 69.0, original_price: 95.0)
    
    ClothingPictureView(clothing: clothing)
}
