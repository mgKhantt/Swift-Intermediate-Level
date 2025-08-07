//
//  CoreDataBootCamp.swift
//  SwiftUi_Intermediate_Level
//
//  Created by Khant Phone Naing  on 06/08/2025.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    let container: NSPersistentContainer
    
    @Published var savedEntities: [FruitEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR Loading CORE Data: \(error)")
            } else {
                print("Successfully loaded Core Data")
            }
        }
        fetchFruits()
    }
    
    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching data: \(error)")
        }
    }
    
    func addItem(text: String) {
        let newFruit = FruitEntity(context: container.viewContext);
        newFruit.name = text
        
        saveData()
    }
    
    func deleteItem(offset: IndexSet) {
        guard let index = offset.first else { return }
        let fruitEntity = savedEntities[index]
        container.viewContext.delete(fruitEntity)
        
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchFruits()
        } catch let error {
            print("Unresolved error \(error)")
        }
    }

}

struct CoreDataBootCamp: View {
    
    @StateObject var coreDataViewModel = CoreDataViewModel()
    
    @State private var textFieldText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter the text", text: $textFieldText)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Button {
                    guard !textFieldText.isEmpty else { return }
                    coreDataViewModel.addItem(text: textFieldText)
                    
                } label: {
                    Text("Add")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(20)
                        .padding(.horizontal)
                }
                
                List {
                    ForEach(coreDataViewModel.savedEntities) { data in
                        Text(data.name ?? "No text")
                    }.onDelete(perform: coreDataViewModel.deleteItem)
                }

            }
            .navigationTitle("Fruits")
        }
    }
}

#Preview {
    CoreDataBootCamp()
}
