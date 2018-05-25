//
//  CharacterPageViewController.swift
//  DND5E Character Tracker
//
//  Created by Vlad Z on 16/05/2018.
//  Copyright © 2018 Vlad Z. All rights reserved.
//

import UIKit

class CharacterPageViewController: UIPageViewController {
    
    var character: Creature?
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        guard let storyboard = storyboard else {
            print("ViewController has no storyboard")
            fatalError()
        }
        let baseStatViewController: BaseStatViewController = storyboard.viewController()
        baseStatViewController.character = character
        return [baseStatViewController,
                newViewController("CombatStatViewController"),
                newViewController("OtherStatViewController")]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        character = Rogue()
        dataSource = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }
    
    private func newViewController(_ viewControllerID: String) -> UIViewController {
        return storyboard?.instantiateViewController(withIdentifier: viewControllerID) ?? UIViewController()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: UIPageViewControllerDataSource

extension CharacterPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let isFirst = viewControllerIndex == 0
        var previousIndex = isFirst ? orderedViewControllers.count : viewControllerIndex
        previousIndex -= 1
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        let isLast = viewControllerIndex == orderedViewControllers.count - 1
        let nextIndex = isLast ? 0 : viewControllerIndex + 1
        return orderedViewControllers[nextIndex]
    }
    
}
