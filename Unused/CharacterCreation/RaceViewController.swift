//
//  RaceViewController.swift
//  DND5E Character Tracker
//
//  Created by Vlad Z on 27/05/2018.
//  Copyright © 2018 Vlad Z. All rights reserved.
//

import UIKit

class RaceViewController: UIViewController {

    @IBOutlet weak var classSelectionTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Pick a race"
        classSelectionTable.delegate = self
        classSelectionTable.dataSource = self
    }
    
    @IBAction func unwindViewController(_ sender: Any) {
        performSegue(withIdentifier: "unwindToCharacterList", sender: self)
    }
    
}

extension RaceViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CharacterRace.raceCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let characterClassCell: CharacterBackgroundCell = tableView.dequeueReusableCell()
        let raceName = CharacterRace(rawValue: indexPath.row)?.name
        characterClassCell.backgroundName.text = raceName
        return characterClassCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
}

extension RaceViewController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let storyboard = storyboard else {
//            fatalError("RaceViewController presented without a storyboard")
//        }
//        let classViewController: ClassViewController = storyboard.viewController()
//        present(classViewController, animated: true, completion: nil)
//    }
    
}
