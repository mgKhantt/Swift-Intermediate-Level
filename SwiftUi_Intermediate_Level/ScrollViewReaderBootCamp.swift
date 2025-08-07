//
//  ScrollViewReaderBootCamp.swift
//  SwiftUi_Intermediate_Level
//
//  Created by Khant Phone Naing  on 15/07/2025.
//

import SwiftUI

struct ScrollViewReaderBootCamp: View {
    
    @State private var text: String = ""
    @State var textIndex: Int = 0
    
    @State var messages: [String] = [
        "Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7", "Item 8", "Item 9", "Item 10"
    ]
    
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView(showsIndicators: false) {
                    ForEach(messages, id: \.self) { index in
                            Text("\(index)")
                            .font(.headline)
                            .frame(width: 300, height: 250)
                            .background(.background)
                            .cornerRadius(20)
                            .shadow(radius: 6)
                            .padding()
                            .id(messages)
                    }
                    .onChange(of: messages.count) {
                        if let lastMessage = messages.last {
                            proxy.scrollTo(lastMessage)
                        }
                    }
                }
            }
            
            VStack {
                Divider().background(.blue)
                
                HStack {
                    TextField("Enter your text", text: $text)
                        .textFieldStyle(.roundedBorder)
                    Button {
                        messages.append(text)
                        text = ""
                    } label: {
                        Image(systemName: "paperplane.fill")
                    }
                    .buttonStyle(PlainButtonStyle())

                }
                .padding()
            }
        }
    }
}

#Preview {
    ScrollViewReaderBootCamp()
}
