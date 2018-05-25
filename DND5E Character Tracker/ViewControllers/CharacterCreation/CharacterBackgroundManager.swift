//
//  CharacterBackgroundManager.swift
//  DND5E Character Tracker
//
//  Created by Vlad Z on 22/05/2018.
//  Copyright © 2018 Vlad Z. All rights reserved.
//

import Foundation

class CharacterBackgroundManager {
    
    static let shared = CharacterBackgroundManager()
    
    let backgrounds: [String]
    
    private init() {
        self.backgrounds = ["Acolyte", "Sage", "Criminal", "Artisan", "Sailor", "Outlander", "Hermit", "Entertainer"]
    }
}
