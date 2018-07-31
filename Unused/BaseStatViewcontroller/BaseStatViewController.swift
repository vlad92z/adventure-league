//
//  BaseStatViewController.swift
//  DND5E Character Tracker
//
//  Created by Vlad Z on 16/05/2018.
//  Copyright © 2018 Vlad Z. All rights reserved.
//

import UIKit

class BaseStatViewController: UIViewController {
    
    @IBOutlet weak var strengthTotal: UILabel!
    @IBOutlet weak var strengthModifier: UILabel!
    @IBOutlet weak var dexterityTotal: UILabel!
    @IBOutlet weak var dexterityModifier: UILabel!
    @IBOutlet weak var constitutionTotal: UILabel!
    @IBOutlet weak var constitutionModifier: UILabel!
    @IBOutlet weak var intelligenceTotal: UILabel!
    @IBOutlet weak var intelligenceModifier: UILabel!
    @IBOutlet weak var wisdomTotal: UILabel!
    @IBOutlet weak var wisdomModifier: UILabel!
    @IBOutlet weak var charismaTotal: UILabel!
    @IBOutlet weak var charismaModifier: UILabel!
    
    @IBOutlet weak var inspiration: UILabel!
    @IBOutlet weak var proficiencyBonus: UILabel!
    @IBOutlet weak var passivePerception: UILabel!
    
    @IBOutlet weak var proficiencyTable: UITableView!
    
    var character: Character?
    
    lazy var sections: [SavingThrowSection] = [SavingThrowSection(with: character!),
                                               SavingThrowSection(with: character!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let character = character else {
            return
        }
        strengthTotal.text = String(character.value(for: .strength))
        strengthModifier.text = String(character.modifier(for: .strength))
        dexterityTotal.text = String(character.value(for: .dexterity))
        dexterityModifier.text = String(character.modifier(for: .dexterity))
        constitutionTotal.text = String(character.value(for: .constitution))
        constitutionModifier.text = String(character.modifier(for: .constitution))
        intelligenceTotal.text = String(character.value(for: .intelligence))
        intelligenceModifier.text = String(character.modifier(for: .intelligence))
        wisdomTotal.text = String(character.value(for: .wisdom))
        wisdomModifier.text = String(character.modifier(for: .wisdom))
        charismaTotal.text = String(character.value(for: .charisma))
        charismaModifier.text = String(character.modifier(for: .charisma))
        
        inspiration.text = String(character.inspiration)
        proficiencyBonus.text = "+\(character.proficiencyBonus)"
        passivePerception.text = String(character.passivePerception)
        
        proficiencyTable.delegate = self
        proficiencyTable.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension BaseStatViewController: UITableViewDelegate {
    
}

extension BaseStatViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell: ProficiencyHeaderCell = tableView.dequeueReusableCell()
        let proficiencySection = sections[section]
        headerCell.title.text = proficiencySection.title
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let proficiencySection = sections[section]
        return proficiencySection.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let proficiencySection = sections[indexPath.section]
        return proficiencySection.cell(at: indexPath.row, for: tableView)
    }
    
    
}
