//
//  CharacterBackground.swift
//  DND5E Character Tracker
//
//  Created by Vlad Z on 25/05/2018.
//  Copyright © 2018 Vlad Z. All rights reserved.
//

import Foundation

enum CharacterBackground: Int {
    
    case acolyte = 0
    case charlatan = 1
    case criminal
    case entertainer
    case folkHero
    case guildArtisan
    case hermit
    case noble
    case outlander
    case sage
    case sailor
    case soldier
    case urchin
    
    static let names = ["Acolyte", "Charlatan", "Criminal", "Entertainer", "Folk Hero",
                        "Guild Artisan", "Hermit", "Noble", "Outlander", "Sage", "Sailor",
                        "Soldier", "Urchin"]
    
    static let backgroundCount = names.count
    
    var name: String {
        let index = self.rawValue
        guard index < CharacterBackground.names.count else {
            fatalError("Character Background index out of bounds")
        }
        return CharacterBackground.names[index]
    }
    
}
