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
