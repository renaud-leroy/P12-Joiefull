//
//  ClothingListView.swift
//  Joiefull
//
//  Created by Renaud Leroy on 06/12/2025.
//

import SwiftUI

struct ClothingListView: View {
    
    @State private var vm = ClothingListViewModel(service: ClothingService())
    @Binding var selectedClothing: Clothing?
    let onSelect: (Clothing) -> Void
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                ForEach(ClothingCategory.allCases.sorted { $0.sortKey < $1.sortKey }, id: \.self) { category in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(category.description)
                            .font(.title2.bold())
                            .accessibilityHidden(true)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(vm.filteredClothes(for: category)) { clothing in
                                    NavigationLink(destination: ClothingDetailView(clothing: clothing)) {
                                        RowView(clothing: clothing)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                        }
                    }
                }
            }
            .padding()
            .task {
                await vm.loadClothes()
            }
        }
    }
}



