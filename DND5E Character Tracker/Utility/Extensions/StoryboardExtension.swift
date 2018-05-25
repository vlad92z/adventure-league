//
//  StoryboardExtension.swift
//  DND5E Character Tracker
//
//  Created by Vlad Z on 16/05/2018.
//  Copyright © 2018 Vlad Z. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    func viewController<T: UIViewController>() -> T {
        let className = String(describing: T.self)
        guard let viewController = instantiateViewController(withIdentifier: className) as? T else {
            print("Could not instantiate \(className)")
            fatalError()
        }
        return viewController
    }
    
}
