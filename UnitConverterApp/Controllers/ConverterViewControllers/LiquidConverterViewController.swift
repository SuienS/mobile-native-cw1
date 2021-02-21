//
//  LiquidConverterViewController.swift
//  UnitConverterApp
//
//  Created by Rammuni Ravidu Suien Silva on 2021-02-07.
//

import UIKit

class LiquidConverterViewController: UIViewController {

    private var prec = "0"
    var validated = false
    
    
    @IBOutlet weak var buttonSave: UIButton!
    @IBOutlet weak var textFieldGallonUK: UITextField!
    @IBOutlet weak var textFieldLitre: UITextField!
    @IBOutlet weak var textFieldPintUK: UITextField!
    @IBOutlet weak var textFieldFluidOunce: UITextField!
    @IBOutlet weak var textFieldMillilitre: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Liquids"
        
        prec = UserDefaults.standard.string(forKey: "precision_decimals") ?? "2" // Nil coalescing

        UserDefaults.standard.string(forKey: "precision_decimals")
        
        buttonSave.isEnabled = false
        
        textFieldGallonUK.text = "0"
        textFieldLitre.text = "0"
        textFieldPintUK.text = "0"
        textFieldFluidOunce.text = "0"
        textFieldMillilitre.text = "0"
        
        textFieldGallonUK.layer.borderWidth = 1.0
        textFieldGallonUK.layer.cornerRadius = 10.0
        textFieldLitre.layer.borderWidth = 1.0
        textFieldLitre.layer.cornerRadius = 10.0
        textFieldPintUK.layer.borderWidth = 1.0
        textFieldPintUK.layer.cornerRadius = 10.0
        textFieldFluidOunce.layer.borderWidth = 1.0
        textFieldFluidOunce.layer.cornerRadius = 10.0
        textFieldMillilitre.layer.borderWidth = 1.0
        textFieldMillilitre.layer.cornerRadius = 10.0
        
        textFieldGallonUK.layer.borderColor = UIColor.systemGray.cgColor
        textFieldLitre.layer.borderColor = UIColor.systemGray.cgColor
        textFieldPintUK.layer.borderColor = UIColor.systemGray.cgColor
        textFieldFluidOunce.layer.borderColor = UIColor.systemGray.cgColor
        textFieldMillilitre.layer.borderColor = UIColor.systemGray.cgColor
        
        UnitAppUtils.syncHistoryData()

    }
    
    @IBAction func textFieldGallonUKChanged(_ sender: UITextField) {
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.GallonUK) {
            
            prec = UserDefaults.standard.string(forKey: "precision_decimals")  ?? "2"
            
            let doubleVal = Double(sender.text!)!
            let gallonUKValStruct = GallonUK(gallonUK: doubleVal)
            
            // Conversion
            let litreValStruct = gallonUKValStruct.toLitre()
            
            let pintValStruct = gallonUKValStruct.toPintUK()
            
            let fluidOunceValStruct = gallonUKValStruct.toFluidOunce()
            
            let litreVal = UnitAppUtils.resultRound(litreValStruct.valueLitre, precision: prec)
            let pintUKVal = UnitAppUtils.resultRound(pintValStruct.valuePintUK, precision: prec)
            let fluidOunceVal = UnitAppUtils.resultRound(fluidOunceValStruct.valueFluidOunce, precision: prec)
            let millilitreVal = UnitAppUtils.resultRound(litreValStruct.valueMillilitre, precision: prec)
            
            
            textFieldLitre.text = String(litreVal)
            textFieldPintUK.text = String(pintUKVal)
            textFieldFluidOunce.text = String(fluidOunceVal)
            textFieldMillilitre.text = String(millilitreVal)
            
            validated = true
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .normal)
        } else {
            validated = false
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .disabled)
        }
    }
    
    @IBAction func textFieldLitreChanged(_ sender: UITextField) {
        
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.Litre) {
            
            prec = UserDefaults.standard.string(forKey: "precision_decimals")  ?? "2"
            
            let doubleVal = Double(sender.text!)!
            let litreValStruct = Litre(litre: doubleVal)
            
            // Conversion
            let gallonUKValStruct = litreValStruct.toGallonUK()
            
            let pintValStruct = litreValStruct.toPintUK()
            
            let fluidOunceValStruct = litreValStruct.toFluidOunce()
            
            let gallonUKVal = UnitAppUtils.resultRound(gallonUKValStruct.valueGallonUK, precision: prec)
            let pintUKVal = UnitAppUtils.resultRound(pintValStruct.valuePintUK, precision: prec)
            let fluidOunceVal = UnitAppUtils.resultRound(fluidOunceValStruct.valueFluidOunce, precision: prec)
            let millilitreVal = UnitAppUtils.resultRound(litreValStruct.valueMillilitre, precision: prec)
            
            
            textFieldGallonUK.text = String(gallonUKVal)
            textFieldPintUK.text = String(pintUKVal)
            textFieldFluidOunce.text = String(fluidOunceVal)
            textFieldMillilitre.text = String(millilitreVal)
            
            validated = true
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .normal)
        } else {
            validated = false
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .disabled)
        }
        
    }
    
    @IBAction func textFieldPintUKChanged(_ sender: UITextField) {
        
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.PintUK) {
            
            prec = UserDefaults.standard.string(forKey: "precision_decimals")  ?? "2"
            
            let doubleVal = Double(sender.text!)!
            let pintUKValStruct = PintUK(pintUK: doubleVal)
            
            // Conversion
            let gallonUKValStruct = pintUKValStruct.toGallonUK()
            
            let litreValStruct = pintUKValStruct.toLitre()
            
            let fluidOunceValStruct = pintUKValStruct.toFluidOunce()
            
            let gallonUKVal = UnitAppUtils.resultRound(gallonUKValStruct.valueGallonUK, precision: prec)
            let litreVal = UnitAppUtils.resultRound(litreValStruct.valueLitre, precision: prec)
            let fluidOunceVal = UnitAppUtils.resultRound(fluidOunceValStruct.valueFluidOunce, precision: prec)
            let millilitreVal = UnitAppUtils.resultRound(litreValStruct.valueMillilitre, precision: prec)
            
            
            textFieldGallonUK.text = String(gallonUKVal)
            textFieldLitre.text = String(litreVal)
            textFieldFluidOunce.text = String(fluidOunceVal)
            textFieldMillilitre.text = String(millilitreVal)
            
            validated = true
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .normal)
        } else {
            validated = false
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .disabled)
        }
        
    }
    
    @IBAction func textFieldFluidOunceChanged(_ sender: UITextField) {
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.FluidOunce) {
            
            prec = UserDefaults.standard.string(forKey: "precision_decimals")  ?? "2"
            
            let doubleVal = Double(sender.text!)!
            let fluidOunceValStruct = FluidOunce(fluidOunce: doubleVal)
            
            // Conversion
            let gallonUKValStruct = fluidOunceValStruct.toGallonUK()
            
            let litreValStruct = fluidOunceValStruct.toLitre()
            
            let pintUKValStruct = fluidOunceValStruct.toPint()
            
            let gallonUKVal = UnitAppUtils.resultRound(gallonUKValStruct.valueGallonUK, precision: prec)
            let litreVal = UnitAppUtils.resultRound(litreValStruct.valueLitre, precision: prec)
            let pintUKVal = UnitAppUtils.resultRound(pintUKValStruct.valuePintUK, precision: prec)
            let millilitreVal = UnitAppUtils.resultRound(litreValStruct.valueMillilitre, precision: prec)
            
            
            textFieldGallonUK.text = String(gallonUKVal)
            textFieldLitre.text = String(litreVal)
            textFieldPintUK.text = String(pintUKVal)
            textFieldMillilitre.text = String(millilitreVal)
            
            validated = true
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .normal)
        } else {
            validated = false
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .disabled)
        }
    }
    
    @IBAction func textFieldMillilitreChanged(_ sender: UITextField) {
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.Millilitre) {
            
            prec = UserDefaults.standard.string(forKey: "precision_decimals")  ?? "2"
            
            let doubleVal = Double(sender.text!)!
            let millilitreValStruct = Litre(millilitre: doubleVal)
            
            // Conversion
            let gallonUKValStruct = millilitreValStruct.toGallonUK()
            
            let pintValStruct = millilitreValStruct.toPintUK()
            
            let fluidOunceValStruct = millilitreValStruct.toFluidOunce()
            
            let gallonUKVal = UnitAppUtils.resultRound(gallonUKValStruct.valueGallonUK, precision: prec)
            let pintUKVal = UnitAppUtils.resultRound(pintValStruct.valuePintUK, precision: prec)
            let fluidOunceVal = UnitAppUtils.resultRound(fluidOunceValStruct.valueFluidOunce, precision: prec)
            let litreVal = UnitAppUtils.resultRound(millilitreValStruct.valueLitre, precision: prec)
            
            
            textFieldGallonUK.text = String(gallonUKVal)
            textFieldPintUK.text = String(pintUKVal)
            textFieldFluidOunce.text = String(fluidOunceVal)
            textFieldLitre.text = String(litreVal)
            
            validated = true
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .normal)
        } else {
            validated = false
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .disabled)
        }
    }
    
    
    
    
    
    // Support Functions
    @IBAction func textFieldEditEnded(_ sender: UITextField) {
        sender.layer.borderColor = UIColor.systemGray.cgColor
    }
    
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        if validated {
            sender.setTitle("Saved", for: .disabled)
            sender.isEnabled = false
            saveHistory()
        }
    }
    
    func saveHistory() {
        var historyEntry = "Liquid: "
        historyEntry += "\( textFieldGallonUK.text ?? "er" ) gal|"
        historyEntry += "\( textFieldLitre.text ?? "er" ) l|"
        historyEntry += "\( textFieldPintUK.text ?? "er" ) pt|"
        historyEntry += "\( textFieldFluidOunce.text ?? "er" ) fl oz|"
        historyEntry += "\( textFieldMillilitre.text ?? "er" ) ml|"
 
        UnitAppUtils.saveHistory(historyString: historyEntry)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
}
