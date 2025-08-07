//
//  CoreDataManager.swift
//  SwiftUi_Intermediate_Level
//
//  Created by Khant Phone Naing  on 07/08/2025.
//

import Foundation
import CoreData

class CoreDataManager {
    static let instance = CoreDataManager()
    
    let container: NSPersistentContainer
    //Core data ကို manage လုပ်မဲ့ persistent container(ရေရှည်ထိန်းသိမ်းနိုင်မဲ့ container) ကို delcare လုပ်တယ်။
    
    let context: NSManagedObjectContext // Provides an interface to interact with Core Data objects.
    //Core Data object တွေနဲ့ interact လုပ်လို့ရမဲ့ interface ကို ထောက်ပံ့ပေးတယ်(CRUD ကို provide ပေးတာ)။
    
    init() {
        container = NSPersistentContainer(name: "CoreDataContainer")
        // Name should match the .xcdatamodeld filename (without extension).
        
        container.loadPersistentStores { description, error in
            // Loads the persistent store (SQLite file).
            if let error = error {
                print("Error on loading CoreData: \(error)")
            }
        }
        context = container.viewContext
        // Main context used for fetching, inserting, deleting, etc.
    }
    
    func save() {
        do {
            try context.save()
            print("Save successfully.")
            // Attempts to save changes in the context to the persistent store.
        } catch let error {
            print("Error on saving Core Data: \(error)")
        }
    }
}
