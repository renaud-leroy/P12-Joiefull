//
//  ClothingSplitView.swift
//  Joiefull
//
//  Created by Renaud Leroy on 12/12/2025.
//

import SwiftUI

struct ClothingSplitView: View {
    
    @State private var selectedClothing: Clothing?
    @Environment(\.horizontalSizeClass) private var hSize
    
    var body: some View {
        
        if hSize == .compact {
            NavigationStack {
                ClothingListView(
                    selectedClothing: $selectedClothing
                ) { clothing in
                    selectedClothing = clothing
                }
            }
        } else {
            NavigationSplitView {
                ClothingListView(
                    selectedClothing: $selectedClothing
                ) { clothing in
                    selectedClothing = clothing
                }
                .toolbar(.hidden)
                .navigationSplitViewColumnWidth(700)
            } detail: {
                if let selectedClothing {
                    ClothingDetailView(clothing: selectedClothing)
                } else {
                    VStack(spacing: 12) {
                        Image(systemName: "tshirt")
                            .font(.largeTitle)
                            .accessibilityHidden(true)
                        Text("Sélectionnez un article pour voir le détail")
                            .font(.headline)
                            .accessibilityLabel(
                                Text("Aucun article sélectionné. Sélectionnez un article dans la liste.")
                            )
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundStyle(.secondary)
                }
            }
        }
    }
}


#Preview {
    let picture = Picture(url: "imagemock", description: "Pull vert forêt à motif torsadé élégant, tricot finement travaillé avec manches bouffantes et col montant; doux et chaleureux.")
    let clothing = Clothing(id: 1, picture: picture, name: "Pull torsadé", category: .tops, likes: 56, price: 69.0, original_price: 95.0)
    
    ClothingSplitView()
}
