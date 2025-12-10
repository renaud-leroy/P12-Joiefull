//
//  ClothingListView.swift
//  Joiefull
//
//  Created by Renaud Leroy on 06/12/2025.
//

import SwiftUI

struct ClothingListView: View {
    
    @StateObject var vm = ClothingListViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 14) {
                    ForEach(ClothingCategory.allCases.sorted { $0.sortKey < $1.sortKey }, id: \.self) { category in
                        Text(category.description.capitalized)
                            .font(Font.title2.bold())
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(vm.filteredClothes(for: category)) { clothing in
                                    NavigationLink(destination: ClothingDetailView(clothing: clothing)) {
                                        RowView(clothing: clothing)
                                            .buttonStyle(.plain)
                                            .frame(width: 200)
                                            .foregroundStyle(Color(.black))
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding()
        .task {
            print("methode appelee")
            await vm.loadClothes()
        }
    }
}



#Preview {
    ClothingListView()
}
