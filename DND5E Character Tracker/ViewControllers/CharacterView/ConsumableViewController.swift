//
//  ConsumableViewController.swift
//  DND5E Character Tracker
//
//  Created by Vlad Z on 05/07/2018.
//  Copyright © 2018 Vlad Z. All rights reserved.
//

import UIKit

class ConsumableViewController: UIViewController {

    var character: PlayableCharacter = PlayableCharacter(with: "")

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func addConsumable(_ sender: Any) {
        let indexPath = IndexPath(row: character.consumables.count, section: 0)
        character.consumables.append(Consumable(name: "", count: 0))
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
}

extension ConsumableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ConsumableViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return character.consumables.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let consumableCell: ConsumableCell = tableView.dequeueReusableCell()
        return consumableCell
    }
}
