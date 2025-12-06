//
//  ShareButtonView.swift
//  Joiefull
//
//  Created by Renaud Leroy on 05/12/2025.
//

import SwiftUI

struct ShareButtonView: View {
    var body: some View {
        Image("shareIcon")
            .font(.system(size: 18, weight: .medium))
            .foregroundStyle(Color(.black))
    }
}

#Preview {
    ShareButtonView()
}
