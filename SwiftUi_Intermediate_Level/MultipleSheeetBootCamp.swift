//
//  MultipleSheeetBootCamp.swift
//  SwiftUi_Intermediate_Level
//
//  Created by Khant Phone Naing  on 19/07/2025.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

class MultipleSheeetViewModel: ObservableObject {
    @Published var title: String = ""
}

struct MultipleSheeetBootCamp: View {
    
    @StateObject var viewModel: MultipleSheeetViewModel = MultipleSheeetViewModel()
    
    @State var isShow: Bool = false
    
    var body: some View {
        VStack {
            Button("Button1") {
                viewModel.title = "Button1"
                isShow.toggle()
            }
            Button("Button2") {
                viewModel.title = "Button2"
                isShow.toggle()
            }
        }
        .sheet(isPresented: $isShow) {
            NextScreen(title: viewModel.title)
        }
    }
    
}

struct NextScreen: View {
    
    let title: String
    
    var body: some View {
        Text(title)
    }
}

#Preview {
    MultipleSheeetBootCamp()
}
