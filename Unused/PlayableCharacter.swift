//
//  PlayableCharacter.swift
//  DND5E Character Tracker
//
//  Created by Vlad Z on 20/06/2018.
//  Copyright © 2018 Vlad Z. All rights reserved.
//

import Foundation

class PlayableCharacter: Character {
    
    static let coreDataEntity = "CharacterEntity"
    
    var name: String
    var consumables: [Consumable] = []
    
    var inspiration: Int = 0
    
    init(with name: String) {
        self.name = name
    }
    
}
