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
        List {
            ForEach(
                ClothingCategory.allCases.sorted { $0.sortKey < $1.sortKey },
                id: \.self
            ) { category in
                Section {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(vm.filteredClothes(for: category)) { clothing in
                                NavigationLink(destination: ClothingDetailView(clothing: clothing)) {
                                    RowView(clothing: clothing)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .listRowInsets(.init(top: 8, leading: 0, bottom: 16, trailing: 0))
                    .listRowSeparator(.hidden)
                } header: {
                    Text(category.description)
                        .font(.title2.bold())
                        .foregroundStyle(Color(.label))
                }
            }
        }
        .listStyle(.plain)
        .task {
            await vm.loadClothes()
        }
    }
}



