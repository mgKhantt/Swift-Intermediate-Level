//
//  CollapsibleStoryHeader.swift
//  SwiftUi_Intermediate_Level
//
//  Created by Khant Phone Naing  on 06/08/2025.
//

import SwiftUI

struct Story: Identifiable {
    let id = UUID()
    let imageName: String
}

struct CollapsibleStoryHeader: View {
    let stories: [Story]

    @State private var dragOffset: CGFloat = 0
    @State private var isExpanded = false

    var body: some View {
        VStack(spacing: 0) {
            GeometryReader { geo in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: isExpanded ? 12 : -20) {
                        ForEach(stories) { story in
                            Image(story.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: isExpanded ? 60 : 40, height: isExpanded ? 60 : 40)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(AngularGradient(
                                            gradient: Gradient(colors: [.blue, .purple]),
                                            center: .center),
                                            lineWidth: 3
                                        )
                                )
                        }
                    }
                    .padding(.horizontal, isExpanded ? 16 : 0)
                    .padding(.top, 10)
                    .animation(.spring(), value: isExpanded)
                }
                .gesture(
                    DragGesture(minimumDistance: 10)
                        .onChanged { gesture in
                            dragOffset = gesture.translation.height
                            if dragOffset > 30 {
                                isExpanded = true
                            } else if dragOffset < -10 {
                                isExpanded = false
                            }
                        }
                )
            }
            .frame(height: isExpanded ? 80 : 50)
        }
    }
}
