//
//  Character.swift
//  DND5E Character Tracker
//
//  Created by Vlad Z on 16/05/2018.
//  Copyright © 2018 Vlad Z. All rights reserved.
//

import Foundation

protocol Character {
    
    var baseStrength: Int { get set }
    var baseDexterity: Int { get set }
    var baseConstitution: Int { get set }
    var baseIntelligence: Int { get set }
    var baseWisdom: Int { get set }
    var baseCharisma: Int { get set }
    
    var inspiration: Int { get set }
    
}
