//
//  CharacterManager.swift
//  DND5E Character Tracker
//
//  Created by Vlad Z on 20/06/2018.
//  Copyright © 2018 Vlad Z. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataResult {
    case success
    case failure(String)
}

class CharacterManager {
    
    static let shared = CharacterManager()
    
    private func getObjects(for characterName: String? = nil) -> [NSManagedObject] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: PlayableCharacter.coreDataEntity)
        if let characterName = characterName {
            let predicate = NSPredicate(format: "name = %@", characterName)
            request.predicate = predicate
        }
        request.returnsObjectsAsFaults = false
        let objects = CoreDataManager.shared.fetch(request)
        return objects
    }
    
    private func isUnique(characterName: String) -> Bool {
        let characterObjects = getObjects(for: characterName)
        return characterObjects.isEmpty
    }
    
    func getStoredCharacters() -> [PlayableCharacter] {
        let characterObjects = getObjects()
        var characterList = [PlayableCharacter]()
        for object in characterObjects {
            if let characterName = object.value(forKey: "name") as? String {
                characterList.append(PlayableCharacter(with: characterName))
            }
        }
        return characterList
    }
    
    func delete(_ name: String) {
        let objects = getObjects(for: name)
        CoreDataManager.shared.delete(objects)
    }
    
    func saveCharacter(with characterName: String) -> CoreDataResult {
        guard isUnique(characterName: characterName) else {
            return .failure("A character with this name already exists")
        }
        
        let character = CharacterEntity(context: CoreDataManager.shared.persistentContainer.viewContext)
        character.name = characterName
        let coreDataManager = CoreDataManager.shared
        coreDataManager.saveContext()
        return .success
    }
    
    func update(_ character: String, with consumables: [Consumable]) {
        let objects = getObjects(for: character)
        guard let object = objects.first else {
            return
        }
        
    }

    
}

