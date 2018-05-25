//
//  CharacterListViewController.swift
//  DND5E Character Tracker
//
//  Created by Vlad Z on 22/05/2018.
//  Copyright © 2018 Vlad Z. All rights reserved.
//

import UIKit

class CharacterListViewController: UIViewController {

    @IBOutlet weak var characterListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterListTable.delegate = self
        characterListTable.dataSource = self
    }
    
    @IBAction func unwindToCharacterList(segue:UIStoryboardSegue) {
        
    }
    
}

extension CharacterListViewController: UITableViewDelegate {
    
}

extension CharacterListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let characterCell: CharacterCell = tableView.dequeueReusableCell()
        return characterCell
    }
    
    
}
