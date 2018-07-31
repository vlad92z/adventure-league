//
//  ClassViewController.swift
//  DND5E Character Tracker
//
//  Created by Vlad Z on 27/05/2018.
//  Copyright © 2018 Vlad Z. All rights reserved.
//

import UIKit

class ClassViewController: UIViewController {

    @IBOutlet weak var classSelectionTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classSelectionTable.delegate = self
        classSelectionTable.dataSource = self
    }
    
    @IBAction func unwindViewController(_ sender: Any) {
        performSegue(withIdentifier: "unwindToCharacterList", sender: self)
    }
    
}

extension ClassViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CharacterClass.classCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let characterClassCell: CharacterBackgroundCell = tableView.dequeueReusableCell()
        let className = CharacterClass(rawValue: indexPath.row)?.name
        characterClassCell.backgroundName.text = className
        return characterClassCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    
}

extension ClassViewController: UITableViewDelegate {
    
}
