//
//  BackgroundViewController.swift
//  DND5E Character Tracker
//
//  Created by Vlad Z on 22/05/2018.
//  Copyright © 2018 Vlad Z. All rights reserved.
//

import UIKit

class BackgroundViewController: UIViewController {
    
    @IBOutlet weak var backgroundSelectionTable: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundSelectionTable.delegate = self
        backgroundSelectionTable.dataSource = self
    }

    @IBAction func unwindViewController(_ sender: Any) {
        performSegue(withIdentifier: "unwindToCharacterList", sender: self)
    }

}

extension BackgroundViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CharacterBackground.backgroundCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let characterBackgroundCell: CharacterBackgroundCell = tableView.dequeueReusableCell()
        let backgroundName = CharacterBackground(rawValue: indexPath.row)?.name
        characterBackgroundCell.backgroundName.text = backgroundName
        return characterBackgroundCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    
}

extension BackgroundViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let storyboard = storyboard else {
            fatalError("BackgroundViewController presented without a storyboard")
        }
        let raceViewController: RaceViewController = storyboard.viewController()
        present(raceViewController, animated: true, completion: nil)
    }
    
}
