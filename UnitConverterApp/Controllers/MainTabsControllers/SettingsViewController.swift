//
//  SettingsViewController.swift
//  UnitConverterApp
//
//  Created by Rammuni Ravidu Suien Silva on 2021-02-07.
//

import UIKit

// View Controller to the Settings view
class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Directs to the main "Settings" App's relavant sub-section
        if let settingsPagePATH = URL(string: UIApplication.openSettingsURLString + Bundle.main.bundleIdentifier!) {
            if UIApplication.shared.canOpenURL(settingsPagePATH) {
                UIApplication.shared.open(settingsPagePATH)
            }
        }
    }
    
    
    @IBAction func buttonSettingsPressed(_ sender: UIButton) {
        
        // Directs to the main "Settings" App's relavant sub-section
        if let settingsPagePATH = URL(string: UIApplication.openSettingsURLString + Bundle.main.bundleIdentifier!) {
            if UIApplication.shared.canOpenURL(settingsPagePATH) {
                UIApplication.shared.open(settingsPagePATH)
            }
        }
    }
    
}
