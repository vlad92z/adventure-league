//
//  FinishCreationViewController.swift
//  DND5E Character Tracker
//
//  Created by Vlad Z on 20/06/2018.
//  Copyright © 2018 Vlad Z. All rights reserved.
//

import UIKit
import CoreData

class FinishCreationViewController: UIViewController {
    
    @IBOutlet weak var characterNameField: UITextField!
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var finishBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var cancelBottomConstraint: NSLayoutConstraint!
    
    private let defaultBottomMargin: CGFloat = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyboardObservers()
    }
    
    private func updateButtonConstraints(to constant: CGFloat) {
        cancelBottomConstraint.constant = defaultBottomMargin + constant
        finishBottomConstraint.constant = defaultBottomMargin + constant
    }
    
    @IBAction func unwindViewController(_ sender: UIButton) {
        if sender == finishButton {
            guard let name = characterNameField.text, !name.isEmpty else {
                presentAlert(with: "Enter character name")
                return
            }
            switch CharacterManager.shared.saveCharacter(with: name){
            case .success:
                break
            case .failure(let message):
                presentAlert(with: message)
                return
            }
        }
        performSegue(withIdentifier: "unwindToCharacterList", sender: self)
    }
    
    private func presentAlert(with message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

//MARK: Keyboard Handling
extension FinishCreationViewController {
    
    private func addKeyboardObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            updateButtonConstraints(to: keyboardSize.height + 20)
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        updateButtonConstraints(to: 0)
    }
    
}
