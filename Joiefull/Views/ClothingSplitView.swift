//
//  ClothingSplitView.swift
//  Joiefull
//
//  Created by Renaud Leroy on 12/12/2025.
//

import SwiftUI

struct ClothingSplitView: View {
    
    @Environment(\.horizontalSizeClass) private var sizeClass
    
    @State private var selectedClothing: Clothing?
    
    var body: some View {
        NavigationSplitView {
            ClothingListView { clothing in
                self.selectedClothing = clothing
            }
            .toolbar(.hidden)
            .navigationSplitViewColumnWidth(800)
        } detail: {
            if let selectedClothing {
                ClothingDetailView(clothing: selectedClothing)
            }
        }
    }
}

#Preview {
    let picture = Picture(url: "imagemock", description: "Pull vert forêt à motif torsadé élégant, tricot finement travaillé avec manches bouffantes et col montant; doux et chaleureux.")
    let clothing = Clothing(id: 1, picture: picture, name: "Pull torsadé", category: .tops, likes: 56, price: 69.0, original_price: 95.0)
    
    ClothingSplitView()
}
