//
//  Skill.swift
//  DND5E Character Tracker
//
//  Created by Vlad Z on 25/05/2018.
//  Copyright © 2018 Vlad Z. All rights reserved.
//

import Foundation

enum Skill: Int {
    
    case acrobatics = 0
    case animalHandling = 1
    case arcana
    case athletics
    case deception
    case history
    case insight
    case intimidation
    case investigation
    case medicine
    case nature
    case perception
    case performance
    case persuasion
    case religion
    case sleightOfHand
    case stealth
    case survival
    
    private static let names = ["Acrobatics", "Animal Handling", "Arcana", "Athletics", "Deception",
                                "History", "Insight", "Intimidation", "Investigation", "Medicine",
                                "Nature", "Perception", "Performance", "Persuasion", "Religion",
                                "Sleight Of Hand", "Stealth", "Survival"]
    
    static let skillCount = names.count
    
    var associatedAbility: Ability {
        switch self {
        case .athletics:
            return .strength
        case .acrobatics, .sleightOfHand, .stealth:
            return .dexterity
        case .arcana, .history, .investigation, .nature, .religion:
            return .intelligence
        case .animalHandling, .insight, .medicine, .perception, .survival:
            return .wisdom
        case .deception, .intimidation, .performance, .persuasion:
            return .charisma
        }
    }
    
    var name: String {
        let index = self.rawValue
        guard index < Skill.names.count else {
            fatalError("Skill index out of bounds")
        }
        return Skill.names[index]
    }
    
}
