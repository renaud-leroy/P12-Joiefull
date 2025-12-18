//
//  RatingView.swift
//  Joiefull
//
//  Created by Renaud Leroy on 05/12/2025.
//

import SwiftUI

struct RatingView: View {
    
    let clothing: Clothing
    @State private var localRating: Int = 0
    
    
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
                .accessibilityHidden(true)
            HStack(spacing: 14) {
                ForEach(1...5, id: \.self) { star in
                    Image(systemName: star <= localRating ? "star.fill" : "star")
                        .font(Font.title)
                        .opacity(star <= localRating ? 1 : 0.5)
                        .foregroundColor(star <= localRating ? .starFilling : .gray)
                        .animation(.easeInOut(duration: 0.15), value: localRating)
                        .onTapGesture {
                            localRating = star
                        }
                }
            }
            .onChange(of: clothing.id) { _ in
                localRating = 0
            }
        }
        
    }
}

