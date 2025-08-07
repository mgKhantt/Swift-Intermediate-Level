//
//  ArrayBootCamp.swift
//  SwiftUi_Intermediate_Level
//
//  Created by Khant Phone Naing  on 22/07/2025.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let points: Int
    let isVerified: Bool
}


class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilterredArray()
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Aung", points: 100, isVerified: true)
        let user2 = UserModel(name: "Zaw", points: 0, isVerified: false)
        let user3 = UserModel(name: "Htet", points: 20, isVerified: true)
        let user4 = UserModel(name: "Nay", points: 33, isVerified: false)
        let user5 = UserModel(name: "Saw", points: 26, isVerified: true)
        let user6 = UserModel(name: "Khin", points: 50, isVerified: false)
        let user7 = UserModel(name: "Than", points: 30, isVerified: true)
        let user8 = UserModel(name: "Myint", points: 45, isVerified: false)
        let user9 = UserModel(name: "Phyo", points: 26, isVerified: true)
        let user10 = UserModel(name: "Kyaw", points: 19, isVerified: false)
        
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10
        ])
    }
    
    func updateFilterredArray() {
//        Sorting
//        filteredArray = dataArray.sorted(by: { user1, user2 in
//            return user1.points > user2.points
//        })
        
//        Filter
//        filteredArray = dataArray.filter({ user in
//            return user.points > 50
//        })
        
//        Map
        mappedArray = dataArray.filter({ user in
            return user.points > 40
        }).map({ user -> String in
            return "\(user.name) - \(user.points)"
        })
        
        
    }
}

struct ArrayBootCamp: View {
    
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(vm.mappedArray, id: \.self) { data in
                    Text(data)
                }
            }
//            VStack(spacing: 20) {
//                ForEach(vm.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                            .font(.headline)
//                        HStack {
//                            Text("Points \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                                    .foregroundColor(.red)
//                            }
//                        }
//                    }
//                    .padding()
//                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
//                    .padding(.horizontal)
//                }
//            }
        }
    }
}

#Preview {
    ArrayBootCamp()
}
