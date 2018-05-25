//
//  SavingThrowSection.swift
//  DND5E Character Tracker
//
//  Created by Vlad Z on 20/05/2018.
//  Copyright © 2018 Vlad Z. All rights reserved.
//

import UIKit

class SavingThrowSection {
    
    let creature: Creature
    
    let title = "SAVING THROWS"
    
    let numberOfCells = Ability.totalAbilities
    
    init(with creature: Creature) {
        self.creature = creature
    }
    
    func cell(at index: Int, for tableView: UITableView) -> ProficiencyCell {
        let proficiencyCell: ProficiencyCell = tableView.dequeueReusableCell()
        guard let ability = Ability.init(rawValue: index) else {
            print("Could not get ability for value: \(index)")
            fatalError()
        }
        var modifier = creature.modifier(for: ability)
        if creature.savingThrows.contains(ability) {
            proficiencyCell.checkBox.backgroundColor = .black
            modifier = modifier + creature.proficiencyBonus
        }
        
        proficiencyCell.modifier.text = "+\(modifier)"
        proficiencyCell.skill.text = ability.name
        proficiencyCell.associatedAbility.isHidden = true
        
        return proficiencyCell
    }
}
