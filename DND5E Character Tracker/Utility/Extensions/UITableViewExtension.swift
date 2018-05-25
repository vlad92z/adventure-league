//
//  UITableViewExtension.swift
//  DND5E Character Tracker
//
//  Created by Vlad Z on 20/05/2018.
//  Copyright © 2018 Vlad Z. All rights reserved.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let className = String(describing: T.self)
        guard let cell = dequeueReusableCell(withIdentifier: className) as? T else {
            print("Could not dequeue \(className)")
            fatalError()
        }
        return cell
    }
    
}
