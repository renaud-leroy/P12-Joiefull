//
//  RowView.swift
//  Joiefull
//
//  Created by Renaud Leroy on 04/12/2025.
//

import SwiftUI

struct RowView: View {
    
    let clothing: Clothing
    let isSelected: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ClothingPictureView(clothing: clothing)
                .scaledToFill()
                .frame(width: 200, height: 200)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(
                            isSelected ? Color.selectItem : .clear,
                            lineWidth: 4
                        )
                )
                .overlay(alignment: .bottomTrailing) {
                    LikeCounterView(clothing: clothing)
                        .padding(12)
                        .accessibilityHidden(true)
                }
                .accessibilityHidden(true)
            PriceView(clothing: clothing, isSelected: isSelected)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 8)
                .font(.subheadline)
                .accessibilityHidden(true)
        }
        .frame(maxWidth: 200, maxHeight: 250)
    }
}



//#Preview {
//    let vm = ClothingListViewModel()
//    let picture = Picture(url: "Imagemock", description: "Pull vert forêt à motif torsadé élégant, tricot finement travaillé avec manches bouffantes et col montant; doux et chaleureux.")
//    let clothing = Clothing(id: 1, picture: picture, name: "Pull torsadé", category: .tops, likes: 56, price: 69.0, original_price: 95.0)
//
//    RowView(vm: vm, clothing: .constant(clothing))
//}
