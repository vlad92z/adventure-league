//
//  CharacterClass.swift
//  DND5E Character Tracker
//
//  Created by Vlad Z on 27/05/2018.
//  Copyright © 2018 Vlad Z. All rights reserved.
//

import Foundation

enum CharacterClass: Int {
    
    case barbarian = 0
    case bard = 1
    case cleric
    case druid
    case fighter
    case monk
    case paladin
    case ranger
    case rogue
    case sorcerer
    case warlock
    case wizard
    
    static let names = ["Barbarian", "Bard", "Cleric", "Druid", "Fighter", "Monk",
                        "Paladin", "Ranger", "Rogue", "Sorcerer", "Warlock", "Wizard"]
    
    static let classCount = names.count
    
    var name: String {
        let index = self.rawValue
        guard index < CharacterClass.names.count else {
            fatalError("Character Class index out of bounds")
        }
        return CharacterClass.names[index]
    }
    
}
