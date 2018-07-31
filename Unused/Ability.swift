//
//  Ability.swift
//  DND5E Character Tracker
//
//  Created by Vlad Z on 20/05/2018.
//  Copyright © 2018 Vlad Z. All rights reserved.
//

enum Ability: Int {
    
    case strength = 0
    case dexterity = 1
    case constitution
    case intelligence
    case wisdom
    case charisma
    
    private static let names = ["Strength", "Dexterity", "Constitution",
                                "Intelligence", "Wisdom", "Charisma"]
    
    static let abilityCount = names.count
    
    var name: String {
        let index = self.rawValue
        guard index < Ability.names.count else {
            fatalError("Ability index out of bounds")
        }
        return Ability.names[index]
    }
    
}
