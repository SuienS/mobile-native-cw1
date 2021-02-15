//
//  KeyboardViewController.swift
//  Unit Keyboard
//
//  Created by Rammuni Ravidu Suien Silva on 2021-02-14.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    //@IBOutlet var nextKeyboardButton: UIButton!
    
    @IBOutlet weak var sideVertical: UIStackView!
    @IBOutlet weak var numRow1: UIStackView!
    @IBOutlet weak var numRow2: UIStackView!
    @IBOutlet weak var numRow3: UIStackView!
    @IBOutlet weak var numRow4: UIStackView!
    
    private var proxyTextDoc: UITextDocumentProxy {
        return textDocumentProxy
    }
    
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func chooseKeyboardPressed(_ sender: UIButton) {
    }
    

    @IBAction func keyPressed(_ sender: UIButton) {
        
        if let inputLabel = sender.titleLabel {
            let inputString = inputLabel.text
            proxyTextDoc.insertText("\(inputString ?? "")")
        }
        
        UIView.animate(withDuration: 0.2, animations: {() -> Void in sender.transform = CGAffineTransform.identity.scaledBy(x: 2.0, y: 2.0)}) {(_) -> Void in sender.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
        }
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        proxyTextDoc.deleteBackward()
        UIView.animate(withDuration: 0.2, animations: {() -> Void in sender.transform = CGAffineTransform.identity.scaledBy(x: 2.0, y: 2.0)}) {(_) -> Void in sender.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
        }
    }
    @IBAction func returnButtonPressed(_ sender: UIButton) {
        self.dismissKeyboard()
        UIView.animate(withDuration: 0.2, animations: {() -> Void in sender.transform = CGAffineTransform.identity.scaledBy(x: 2.0, y: 2.0)}) {(_) -> Void in sender.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
        }
    }
    
    
    override func viewWillLayoutSubviews() {
//        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
//        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        
        
//        var textColor: UIColor
//        let proxy = self.textDocumentProxy
//        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
//            textColor = UIColor.white
//        } else {
//            textColor = UIColor.black
//        }
//        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

}
