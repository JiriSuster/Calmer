//
//  SoundViewModel.swift
//  Calmer
//
//  Created by Adéla Kulíšková on 31.05.2024.
//

import Foundation
import UIKit
import SwiftUI
import CoreData

class SoundViewModel: ObservableObject{
    private var moc: NSManagedObjectContext
    @Published var soundItems: [SoundItem] = []
    
    
    init(moc: NSManagedObjectContext) {
        self.moc = moc
        fetchSoundsItems()
        //deleteAllData()
        print("pocet dat je: \(self.soundItems.count)")
        if self.soundItems.count == 0 {
            self.addSampleData()
            self.fetchSoundsItems()
        }
    }
    
    func deleteAllData() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "MusicDb")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try moc.execute(deleteRequest)
            save() // Ensure the deletion is saved
        } catch {
            print("Failed to delete existing data: \(error.localizedDescription)")
        }
    }

    
    private func fetchPois() -> [MusicDb] {
        let request = NSFetchRequest<MusicDb>(entityName: "MusicDb")
        var poi: [MusicDb] = []
        
        do {
            poi = try moc.fetch(request)
        }catch {
            print("Some error occured while fetching")
        }
        return poi
    }
    
    func fetchSoundsItems() {
            let pois = fetchPois()
            
        self.soundItems = pois.map{
                let image: UIImage
            if let storedImageData = $0.image{
                    image = UIImage(data: storedImageData) ?? UIImage()
                } else {
                    image = UIImage(named: "empty") ?? UIImage()
                }
                
                return SoundItem(
                    id: $0.id ?? UUID(),
                    name: $0.name ?? "Unknown",
                    category: $0.category ?? "",
                    image: image,
                    tape: $0.tape ?? "Unknown"
                )
            }
        }
 
    func addNewSoundItem(soundItem: SoundItem) {
        let newPoi = MusicDb(context: moc)
        newPoi.id = soundItem.id
        newPoi.image = soundItem.image.jpegData(compressionQuality: 0.8)
        newPoi.name = soundItem.name
        newPoi.category = soundItem.category
        newPoi.tape = soundItem.tape
        save()
    }
    
    func save(){
        if moc.hasChanges{
            do{
                try moc.save()
            } catch {
                print("Cannot save MOC: \(error.localizedDescription)")
            }
        }
    }
    
    func addSampleData(){
        // create sample map items
        let first_song = SoundItem(name: "Morning breathing", category: "Focus", image: UIImage(named: "sea") ?? UIImage(), tape: "morning")
        let second_song = SoundItem(name: "Evening meditation", category: "Calm", image: UIImage(named: "nightsky") ?? UIImage(), tape: "evening")
        let third_song = SoundItem(name: "Fireplace", category: "Relaxing", image: UIImage(named: "fireplace") ?? UIImage(), tape: "fireplace")
        let fourth_song = SoundItem(name: "Forest rain", category: "Relief", image: UIImage(named: "forest") ?? UIImage(), tape: "rain")
        let five_song = SoundItem(name: "River", category: "Sleep", image: UIImage(named: "river") ?? UIImage(), tape: "river")
        // covert to PoIs
        addNewSoundItem(soundItem: first_song)
        addNewSoundItem(soundItem: second_song)
        addNewSoundItem(soundItem: third_song)
        addNewSoundItem(soundItem: fourth_song)
        addNewSoundItem(soundItem: five_song)
        // save to DB
    }

    
}
