//
//  MaskBootCamp.swift
//  SwiftUi_Intermediate_Level
//
//  Created by Khant Phone Naing  on 19/07/2025.
//

import SwiftUI

struct MaskBootCamp: View {
    
    @State var rating: Int = 2
    
    var body: some View {
        ZStack {
            startView
                .overlay {
                    overLayView.mask(startView)
                }
        }
    }
    
    private var overLayView: some View {
        GeometryReader { reader in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundStyle(.yellow)
                    .frame(width: CGFloat(rating) / 5 * reader.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var startView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .foregroundStyle(
                        rating >= index ? .yellow : .gray
                    )
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                    }
            }
        }
    }
}

#Preview {
    MaskBootCamp()
}
