//
//  ConsumableCell.swift
//  DND5E Character Tracker
//
//  Created by Vlad Z on 05/07/2018.
//  Copyright © 2018 Vlad Z. All rights reserved.
//

import UIKit

class ConsumableCell: UITableViewCell, UITextFieldDelegate {
    
    var amount = 0

    @IBOutlet weak var consumableName: UITextField!
    @IBOutlet weak var consumableAmount: UILabel!
    
    @IBAction func decrement(_ sender: UIButton) {
        amount -= 1
        consumableAmount.text = "\(amount)"
    }
    @IBAction func increment(_ sender: UIButton) {
        amount += 1
        consumableAmount.text = "\(amount)"
    }
    
    
}
