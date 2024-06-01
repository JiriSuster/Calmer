//
//  CoreDataController.swift
//  Calmer
//
//  Created by Adéla Kulíšková on 31.05.2024.
//

import Foundation
import CoreData

class CoreDataController: ObservableObject{
    let container = NSPersistentContainer(name: "db")
    
    init(){
        container.loadPersistentStores{ description, error in
            if let error = error {
                print("Core Data failed to create container: \(error.localizedDescription)")
            }
        }
    }
}
