//
//  ClothingListView.swift
//  Joiefull
//
//  Created by Renaud Leroy on 06/12/2025.
//

import SwiftUI

struct ClothingListView: View {
    
    @StateObject var vm = ClothingListViewModel()
    
   //TODO: ajouter des sections representant des categories avec une scrollview par section
    
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal) {
                LazyHGrid(
                    rows: [
                        GridItem(.fixed(250))
                    ],
                    spacing: 15
                ) {
                    ForEach(vm.clothes) { clothing in
                        RowView(clothing: clothing)
                            .frame(width: 200, height: 300)
                    }
                }
            }
        }
        .task {
            await vm.loadClothing()
        }
    }
}

#Preview {
    ClothingListView()
}
