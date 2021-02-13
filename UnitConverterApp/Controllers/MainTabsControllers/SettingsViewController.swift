//
//  SettingsViewController.swift
//  UnitConverterApp
//
//  Created by Rammuni Ravidu Suien Silva on 2021-02-07.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        if let settingsPagePATH = URL(string: UIApplication.openSettingsURLString + Bundle.main.bundleIdentifier!) {
            if UIApplication.shared.canOpenURL(settingsPagePATH) {
                UIApplication.shared.open(settingsPagePATH)
            }
        }
    }
    @IBAction func buttonSettingsPressed(_ sender: UIButton) {
        if let settingsPagePATH = URL(string: UIApplication.openSettingsURLString + Bundle.main.bundleIdentifier!) {
            if UIApplication.shared.canOpenURL(settingsPagePATH) {
                UIApplication.shared.open(settingsPagePATH)
            }
        }
    }
    
}
