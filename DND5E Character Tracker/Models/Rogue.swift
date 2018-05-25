//
//  Rogue.swift
//  DND5E Character Tracker
//
//  Created by Vlad Z on 16/05/2018.
//  Copyright © 2018 Vlad Z. All rights reserved.
//
import Foundation
class Rogue: Creature {
    
    var inspiration: Int = 0
    
    func value(for ability: Ability) -> Int {
        return 12
    }
    
    var savingThrows: [Ability] = [.dexterity, .intelligence]
    
}
