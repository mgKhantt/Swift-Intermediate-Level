//
//  MagnificationGestureBootCamp.swift
//  SwiftUi_Intermediate_Level
//
//  Created by Khant Phone Naing  on 11/07/2025.
//

import SwiftUI

struct MagnificationGestureBootCamp: View {
    
    @State var currentAmount: CGFloat = 0
    @State var lastAmount: CGFloat = 0
    
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 55, height: 55)
                Text("SwiftUI")
                Spacer()
                Image(systemName: "ellipsis")
            }.padding()
            Rectangle()
                .frame(height: 300)
                .scaleEffect(currentAmount + 1)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            currentAmount = value - 1
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                currentAmount = 0
                            }
                        }
                )
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "message.fill")
                Spacer()
            }
            .padding(.horizontal)
            .font(.headline)
            Text("This is the caption of my photo")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
    }
}

#Preview {
    MagnificationGestureBootCamp()
}

//        Text("Hello, World!")
//            .foregroundStyle(.white)
//            .frame(width: 300, height: 200)
//            .background(.red)
//            .cornerRadius(20)
//            .scaleEffect(currentAmount + 1 + lastAmount)
//            .gesture(
//                MagnificationGesture()
//                    .onChanged { value in
//                        currentAmount = value - 1
//                    }
//                    .onEnded { value in
//                        lastAmount += currentAmount
//                        currentAmount = 0
//                    }
//            )
