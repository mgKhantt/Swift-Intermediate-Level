//
//  LongPressGestureBootCamp.swift
//  SwiftUi_Intermediate_Level
//
//  Created by Khant Phone Naing  on 11/07/2025.
//

import SwiftUI

struct LongPressGestureBootCamp: View {
    
    @State var isCompleted: Bool = false
    @State var isSuccess: Bool = false
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(isSuccess ? Color.green : Color.blue)
                .frame(maxWidth: isCompleted ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
            
            HStack {
                Text("Click here")
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(8)
                    .onLongPressGesture(minimumDuration: 3, maximumDistance: 50) {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            isSuccess = true
                        }
                    } onPressingChanged: { isPressing in
                        if isPressing {
                            withAnimation(.easeInOut(duration: 2.0)) {
                                isCompleted.toggle()
                            }
                        } else {
                            if !isSuccess {
                                withAnimation(.easeInOut(duration: 1.0)) {
                                    isCompleted = false
                                }
                            }
                        }
                    }


                
                Text("RESET")
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(8)
                    .onLongPressGesture(minimumDuration: 3.0) {
                        withAnimation(.easeIn(duration: 2.0)) {
                            isCompleted = false
                            isSuccess = false
                        }
                    }
            }
        }
    }
}

#Preview {
    LongPressGestureBootCamp()
}
