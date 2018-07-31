//
//  CharacterRace.swift
//  DND5E Character Tracker
//
//  Created by Vlad Z on 25/05/2018.
//  Copyright © 2018 Vlad Z. All rights reserved.
//

import Foundation

enum CharacterRace: Int {
    
    case dwarf = 0
    case elf = 1
    case halfling
    case human
    case dragonborn
    case gnome
    case halfElf
    case halfOrc
    case tiefling
    
    static func abilityBonusOfChoice(for race: CharacterRace) -> Int {
        switch race {
        case .halfElf:
            return 2
        default:
            return 0
        }
    }
    
    static let names = ["Dwarf", "Elf", "Halfling", "Human", "Dragonborn",
                        "Gnome", "Half-Elf", "Half-Orc", "Tiefling"]
    
    static let raceCount = names.count
    
    var name: String {
        let index = self.rawValue
        guard index < CharacterRace.names.count else {
            fatalError("Character Background index out of bounds")
        }
        return CharacterRace.names[index]
    }
    
    func abilityScoreBonus(for ability: Ability) -> Int {
        switch self {
        case .dwarf:
            return dwarfBonus(for: ability)
        case .elf:
            return elfBonus(for: ability)
        case .halfling:
            return halflingBonus(for: ability)
        case .human:
            return 1
        case .dragonborn:
            return dragonbornBonus(for: ability)
        case .gnome:
            return gnomeBonus(for: ability)
        case .halfElf:
            return halfElfBonus(for: ability)
        case .halfOrc:
            return halfOrcBonus(for: ability)
        default:
            return 0
        }
    }
    
}

extension CharacterRace {
    
    private func dwarfBonus(for ability: Ability) -> Int {
        switch ability {
        case .constitution:
            return 2
        default:
            return 0
        }
    }
    
    private func elfBonus(for ability: Ability) -> Int {
        switch ability {
        case .dexterity:
            return 2
        default:
            return 0
        }
    }
    
    private func halflingBonus(for ability: Ability) -> Int {
        switch ability {
        case .dexterity:
            return 2
        default:
            return 0
        }
    }
    
    private func dragonbornBonus(for ability: Ability) -> Int {
        switch ability {
        case .strength:
            return 2
        case .charisma:
            return 1
        default:
            return 0
        }
    }
    
    private func gnomeBonus(for ability: Ability) -> Int {
        switch ability {
        case .intelligence:
            return 2
        default:
            return 0
        }
    }
    
    private func halfElfBonus(for ability: Ability) -> Int {
        switch ability {
        case .charisma:
            return 2
        default:
            return 0
        }
    }
    
    private func halfOrcBonus(for ability: Ability) -> Int {
        switch ability {
        case .strength:
            return 2
        case .constitution:
            return 1
        default:
            return 0
        }
    }
    
    private func tieflingOrcBonus(for ability: Ability) -> Int {
        switch ability {
        case .charisma:
            return 2
        case .intelligence:
            return 1
        default:
            return 0
        }
    }
    
}


