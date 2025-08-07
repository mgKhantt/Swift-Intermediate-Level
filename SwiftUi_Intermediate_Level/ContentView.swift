//
//  ContentView.swift
//  SwiftUi_Intermediate_Level
//
//  Created by Khant Phone Naing  on 11/07/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CollapsibleStoryHeader(stories: [
                Story(imageName: "profile1"),
                Story(imageName: "profile2"),
                Story(imageName: "profile3"),
                Story(imageName: "profile4")
            ])
            Spacer()
        }
    }
}


#Preview {
    ContentView()
}
