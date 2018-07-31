//
//  CharacterListViewController.swift
//  DND5E Character Tracker
//
//  Created by Vlad Z on 22/05/2018.
//  Copyright © 2018 Vlad Z. All rights reserved.
//

import UIKit

class CharacterListViewController: UIViewController {
    
    var characterList = CharacterManager.shared.getStoredCharacters()

    @IBOutlet weak var characterListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterListTable.delegate = self
        characterListTable.dataSource = self
    }
    
    @IBAction func unwindToCharacterList(segue:UIStoryboardSegue) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        characterList = CharacterManager.shared.getStoredCharacters()
        characterListTable.reloadData()
    }
    
}

extension CharacterListViewController: UITableViewDelegate {
    
}

extension CharacterListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let characterCell: CharacterCell = tableView.dequeueReusableCell()
        characterCell.characterNameLabel.text = characterList[indexPath.row].name
        return characterCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let characterIndex = indexPath.row
            let character = characterList[characterIndex]
            CharacterManager.shared.delete(character.name)
            characterList.remove(at: characterIndex)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
}
