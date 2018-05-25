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
    
    var name: String {
        switch self {
        case .strength:
            return "Strength"
        case .dexterity:
            return "Dexterity"
        case .constitution:
            return "Constitution"
        case .intelligence:
            return "Intelligence"
        case .wisdom:
            return "Wisdom"
        case .charisma:
            return "Charisma"
        }
    }
    
    static let totalAbilities = 6
    
}
