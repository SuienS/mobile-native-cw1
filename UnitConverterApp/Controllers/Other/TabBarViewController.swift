//
//  TabBarViewController.swift
//  UnitConverterApp
//
//  Created by Rammuni Ravidu Suien Silva on 2021-02-22.
//

import UIKit

class TabBarViewController: UITabBarController {
//// ISSUEEEE
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Setting Dark Mode
        let darkMode = UserDefaults.standard.bool(forKey: "darkmode_switch")
        if darkMode {
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
        }
    }

}

extension TabBarViewController: UITabBarControllerDelegate  {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {

        // Animation for Tab Change
        guard let fromTabView = selectedViewController?.view, let toTabView = viewController.view else {
          return false
        }

        if fromTabView != toTabView {
            UIView.transition(from: fromTabView, to: toTabView, duration: 0.3, options: [.transitionFlipFromBottom], completion: nil)
        }
        
        // Setting DarkMode
        let darkMode = UserDefaults.standard.bool(forKey: "darkmode_switch")
        if darkMode {
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
        }

        return true
    }
}
