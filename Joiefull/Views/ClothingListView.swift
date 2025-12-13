//
//  ClothingListView.swift
//  Joiefull
//
//  Created by Renaud Leroy on 06/12/2025.
//

import SwiftUI

struct ClothingListView: View {

    @State var vm = ClothingListViewModel()
    let onSelect: (Clothing) -> Void

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 14) {
                ForEach(ClothingCategory.allCases.sorted { $0.sortKey < $1.sortKey }, id: \.self) { category in
                    Text(category.description.capitalized)
                        .font(.title2.bold())

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(vm.filteredClothes(for: category)) { clothing in
                                Button {
                                    onSelect(clothing)
                                } label: {
                                    RowView(clothing: clothing)
                                        .frame(width: 200)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .task {
            await vm.loadClothes()
        }
    }
}




#Preview {
    ClothingListView { _ in }
}



