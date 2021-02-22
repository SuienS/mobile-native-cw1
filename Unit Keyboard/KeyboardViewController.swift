//
//  KeyboardViewController.swift
//  Unit Keyboard
//
//  Created by Rammuni Ravidu Suien Silva on 2021-02-14.
//

import UIKit

// Custom Keyboard Extension for the App
class KeyboardViewController: UIInputViewController {

    // Keyboard button outlets
    @IBOutlet weak var sideVertical: UIStackView!
    @IBOutlet weak var numRow1: UIStackView!
    @IBOutlet weak var numRow2: UIStackView!
    @IBOutlet weak var numRow3: UIStackView!
    @IBOutlet weak var numRow4: UIStackView!
    
    // getting the Proxy
    private var proxyTextDoc: UITextDocumentProxy {
        return textDocumentProxy
    }
    
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Dark Mode setting
        let darkMode = UserDefaults.standard.bool(forKey: "darkmode_switch")
        if darkMode {
            overrideUserInterfaceStyle = .dark
        }
    }

    // Keyboard Key number press handle
    @IBAction func keyPressed(_ sender: UIButton) {
        
        if let inputLabel = sender.titleLabel {
            let inputString = inputLabel.text
            proxyTextDoc.insertText("\(inputString ?? "")")
        }
        
        UIView.animate(withDuration: 0.2, animations: {() -> Void in sender.transform = CGAffineTransform.identity.scaledBy(x: 2.0, y: 2.0)}) {(_) -> Void in sender.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
        }
    }
    
    // Keyboard backspace button handle
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        proxyTextDoc.deleteBackward()
        UIView.animate(withDuration: 0.2, animations: {() -> Void in sender.transform = CGAffineTransform.identity.scaledBy(x: 2.0, y: 2.0)}) {(_) -> Void in sender.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
        }
    }
    
    // Keyboard return key handle
    @IBAction func returnButtonPressed(_ sender: UIButton) {
        self.dismissKeyboard()
        UIView.animate(withDuration: 0.2, animations: {() -> Void in sender.transform = CGAffineTransform.identity.scaledBy(x: 2.0, y: 2.0)}) {(_) -> Void in sender.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
        }
    }
    
    
    override func viewWillLayoutSubviews() {

    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }

}
