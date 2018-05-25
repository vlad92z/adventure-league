//
//  Creature
//  DND5E Character Tracker
//
//  Created by Vlad Z on 16/05/2018.
//  Copyright © 2018 Vlad Z. All rights reserved.
//

import Foundation

protocol Creature {
    
    var armorClass: Int { get }
    var passivePerception: Int { get }
    
    var languages: [String] { get }
    var savingThrows: [Ability] { get }
    
    var inspiration: Int { get set }
    
    var proficiencyBonus: Int { get }
    
    func value(for ability: Ability) -> Int
    func modifier(for ability: Ability) -> Int
    
}

extension Creature {
    
    var languages: [String] {
        return []
    }
    
    func value(for ability: Ability) -> Int {
        return 0
    }
    
    func modifier(for ability: Ability) -> Int {
        let abilityValue = value(for: ability)
        return (abilityValue - 10)/2
    }
    
    var passivePerception: Int {
        //TODO: update this
        return 10 + modifier(for: .wisdom)
    }
    
    var armorClass: Int {
        return 10 + modifier(for: .dexterity)
    }
    
    var proficiencyBonus: Int {
        return 2
    }
    
    var savingThrows: [Ability] {
        return []
    }
    
}
