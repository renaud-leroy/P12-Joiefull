//
//  ClothingListView.swift
//  Joiefull
//
//  Created by Renaud Leroy on 06/12/2025.
//

import SwiftUI

struct ClothingListView: View {
    
    @State private var vm = ClothingListViewModel(service: ClothingService())
    @State private var searchQuery: String = ""
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
                            ForEach(vm.searchedClothes(for: category, query: searchQuery)) { clothing in
                                NavigationLink(destination: ClothingDetailView(clothing: clothing)) {
                                    RowView(clothing: clothing)
                                        .accessibilityElement(children: .ignore)
                                        .accessibilityLabel(
                                            Text("\(clothing.name), \(Int(clothing.price)) euros, \(clothing.likes) likes")
                                        )
                                        .accessibilityHint(
                                            Text("Afficher le détail de l’article")
                                        )
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
        .searchable(text: $searchQuery, prompt: "Rechercher un article")
        .searchToolbarBehavior(SearchToolbarBehavior.minimize)
        .task {
            await vm.loadClothes()
        }
    }
}








