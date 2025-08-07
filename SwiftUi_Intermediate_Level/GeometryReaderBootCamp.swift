//
//  GeometryReaderBootCamp.swift
//  SwiftUi_Intermediate_Level
//
//  Created by Khant Phone Naing  on 17/07/2025.
//

import SwiftUI

struct GeometryReaderBootCamp: View {
    var body: some View {
        ScrollView() {
            VStack {
                ForEach(0..<50) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 1)
                            .rotation3DEffect(
                                Angle(degrees: getPercentage(geo: geometry) * 40),
                                axis: (x: 1, y: 0, z: 0)
                            )
                            .padding()
                    }
                    .frame(width: 300, height: 200)
                    .padding()
                }
            }
        }
        .scrollIndicators(.hidden)
    }
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.height / 2
        let currentX = geo.frame(in: .global).midY
        let percentage = max(-1, min(1, 1 - (currentX / maxDistance)))
        return Double(percentage)
    }
}

#Preview {
    GeometryReaderBootCamp()
}
