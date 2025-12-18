//
//  ClothingSplitView.swift
//  Joiefull
//
//  Created by Renaud Leroy on 12/12/2025.
//

import SwiftUI

struct ClothingSplitView: View {
    
    @State private var selectedClothing: Clothing?
    
    var body: some View {
        NavigationSplitView {
            ClothingListView(selectedClothing: $selectedClothing) { clothing in
                self.selectedClothing = clothing
            }
            .toolbar(.hidden)
            .navigationSplitViewColumnWidth(700)
        } detail: {
            if let selectedClothing {
                ClothingDetailView(clothing: selectedClothing)
            }
            else {
                VStack(spacing: 12) {
                    Image(systemName: "tshirt")
                        .font(.system(size: 48))
                        .foregroundStyle(.secondary)
                    Text("Sélectionnez un article pour voir le détail")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

#Preview {
    let picture = Picture(url: "imagemock", description: "Pull vert forêt à motif torsadé élégant, tricot finement travaillé avec manches bouffantes et col montant; doux et chaleureux.")
    let clothing = Clothing(id: 1, picture: picture, name: "Pull torsadé", category: .tops, likes: 56, price: 69.0, original_price: 95.0)
    
    ClothingSplitView()
}
