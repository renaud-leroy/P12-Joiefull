//
//  RatingView.swift
//  Joiefull
//
//  Created by Renaud Leroy on 05/12/2025.
//

import SwiftUI

struct RatingView: View {
    var body: some View {
        HStack(spacing: 20) {
            Image("userAvatar")
                .resizable()
                .frame(maxWidth: 45, maxHeight: 45)
                .scaledToFill()
                .scaleEffect(1.4)
                .offset(x: -5, y: 8)
                .clipShape(Circle())
                .clipped()
            HStack(spacing: 15) {
                ForEach (1...5, id: \.self) { _ in
                    Image(systemName: "star")
                        .font(Font.title2)
                        .opacity(0.5)
                }
            }
        }
    }
}

#Preview {
    RatingView()
}
