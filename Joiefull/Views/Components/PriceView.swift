//
//  PriceView.swift
//  Joiefull
//
//  Created by Renaud Leroy on 05/12/2025.
//

import SwiftUI

struct PriceView: View {
    
    let clothing: Clothing
    
    var body: some View {
        VStack(spacing: 2){
            HStack(spacing: 3) {
                Text(clothing.name)
                    .fontWeight(.semibold)
                Spacer()
                Image("starRatingFilled")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(Color(.starFilling))
                    .frame(maxWidth: 13, maxHeight: 13)
                Text("4.4")
            }
            HStack {
                Text("\(clothing.price, specifier: "%.0f")€")
                Spacer()
                Text("\(clothing.original_price, specifier: "%.0f")€")
                    .strikethrough()
                    .opacity(0.7)
            }
        }
    }
}

#Preview {
    let picture = Picture(url: "imagemock", description: "Pull vert forêt à motif torsadé élégant, tricot finement travaillé avec manches bouffantes et col montant; doux et chaleureux.")
    let clothing = Clothing(id: 1, picture: picture, name: "Pull torsadé", category: .tops, likes: 56, price: 69.0, original_price: 95.0)
    
    PriceView(clothing: clothing)
}
