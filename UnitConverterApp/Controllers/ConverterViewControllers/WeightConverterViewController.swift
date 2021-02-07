//
//  LengthConverterViewController.swift
//  UnitConverterApp
//
//  Created by Rammuni Ravidu Suien Silva on 2021-02-07.
//

import UIKit

class WeightConverterViewController: UIViewController {
    
    @IBOutlet weak var textFieldGrams: UITextField!
    @IBOutlet weak var textFieldKilograms: UITextField!
    @IBOutlet weak var textFieldPounds: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Length Converter"
        textFieldGrams.text = "0"
        textFieldKilograms.text = "0"
        textFieldPounds.text = "0"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func textFieldGramsChanged(_ sender: UITextField) {
        if textFieldGrams.hasText {
            let kilogramValue = (Float)(textFieldGrams.text!)! * 0.001
            textFieldKilograms.text = String(format: "%.2f", kilogramValue)
        }
    }
    

}
