//
//  Consumable.swift
//  DND5E Character Tracker
//
//  Created by Vlad Z on 05/07/2018.
//  Copyright © 2018 Vlad Z. All rights reserved.
//

import Foundation

struct Consumable {
    
    let name: String
    var count = 0
    
    mutating func increment() {
        count += 1
    }
    
    mutating func decrement() {
        count -= 1
    }
    
    
    
}
