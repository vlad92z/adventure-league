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
    
    @IBOutlet weak var proficiencyTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "ProficiencyCell")!
    }
    
    
}
