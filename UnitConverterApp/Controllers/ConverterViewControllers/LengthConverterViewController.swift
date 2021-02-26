//
//  LengthConverterViewController.swift
//  UnitConverterApp
//
//  Created by Rammuni Ravidu Suien Silva on 2021-02-07.
//

import UIKit

// ViewController for Length Convertor
class LengthConverterViewController: UIViewController {
    
    private var prec = "0"
    var validated = false
    
    // Key for UserDefaults history data
    var key = "historyEntriesLength"
    
    
    // Outlets for the UI elements
    @IBOutlet weak var buttonSave: UIButton!
    @IBOutlet weak var textFieldMetres: UITextField!
    @IBOutlet weak var textFieldKilometres: UITextField!
    @IBOutlet weak var textFieldMiles: UITextField!
    @IBOutlet weak var textFieldCentimetres: UITextField!
    @IBOutlet weak var textFieldMillimetres: UITextField!
    @IBOutlet weak var textFieldYards: UITextField!
    @IBOutlet weak var textFieldInches: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Length"
        
        prec = UserDefaults.standard.string(forKey: "precision_decimals") ?? "2" // Nil coalescing

        
        // Setting Precision
        UserDefaults.standard.string(forKey: "precision_decimals")
        
        
        // UI setup
        
        buttonSave.isEnabled = false
        
        textFieldMetres.text = "0"
        textFieldKilometres.text = "0"
        textFieldMiles.text = "0"
        textFieldCentimetres.text = "0"
        textFieldMillimetres.text = "0"
        textFieldYards.text = "0"
        textFieldInches.text = "0"

        textFieldMetres.layer.borderWidth = 1.0
        textFieldMetres.layer.cornerRadius = 10.0
        textFieldKilometres.layer.borderWidth = 1.0
        textFieldKilometres.layer.cornerRadius = 10.0
        textFieldMiles.layer.borderWidth = 1.0
        textFieldMiles.layer.cornerRadius = 10.0
        textFieldCentimetres.layer.borderWidth = 1.0
        textFieldCentimetres.layer.cornerRadius = 10.0
        textFieldMillimetres.layer.borderWidth = 1.0
        textFieldMillimetres.layer.cornerRadius = 10.0
        textFieldYards.layer.borderWidth = 1.0
        textFieldYards.layer.cornerRadius = 10.0
        textFieldInches.layer.borderWidth = 1.0
        textFieldInches.layer.cornerRadius = 10.0
        
        textFieldMetres.layer.borderColor = UIColor.systemGray.cgColor
        textFieldKilometres.layer.borderColor = UIColor.systemGray.cgColor
        textFieldMiles.layer.borderColor = UIColor.systemGray.cgColor
        textFieldCentimetres.layer.borderColor = UIColor.systemGray.cgColor
        textFieldMillimetres.layer.borderColor = UIColor.systemGray.cgColor
        textFieldYards.layer.borderColor = UIColor.systemGray.cgColor
        textFieldInches.layer.borderColor = UIColor.systemGray.cgColor
        
        // Synchronizing the History Data
        UnitAppUtils.syncHistoryData(historyEntries: &UnitAppUtils.historyEntriesLength, key: key)
    }

    
    // TextField EditingChanged Functions
    
    @IBAction func textFieldMetresChanged(_ sender: UITextField) {
        
        // Validating the Input
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.Metre) {
            
            // Retriving Precision setting
            prec = UserDefaults.standard.string(forKey: "precision_decimals")  ?? "2"
            
            let doubleVal = Double(sender.text!)!
            let metreValStruct = Metre(metres: doubleVal)
            
            // Conversion
            let milesValStruct = metreValStruct.toMile()
            
            let inchesValStruct = metreValStruct.toInch()
            
            let yardsValStruct = metreValStruct.toYard()
            
            let milesVal = UnitAppUtils.resultRound(milesValStruct.valueMile, precision: prec)
            let inchesVal = UnitAppUtils.resultRound(inchesValStruct.valueInch, precision: prec)
            let yardsVal = UnitAppUtils.resultRound(yardsValStruct.valueYards, precision: prec)
            
            let millimetreVal = UnitAppUtils.resultRound(metreValStruct.valueMillimetre, precision: prec)
            let centimetreVal = UnitAppUtils.resultRound(metreValStruct.valueCentimetre, precision: prec)
            let kilometreVal = UnitAppUtils.resultRound(metreValStruct.valueKilometre, precision: prec)
            
            
            // Displaying Output answers in UI
            textFieldMiles.text = String(milesVal)
            textFieldYards.text = String(yardsVal)
            textFieldInches.text = String(inchesVal)
            
            textFieldMillimetres.text = String(millimetreVal)
            textFieldCentimetres.text = String(centimetreVal)
            textFieldKilometres.text = String(kilometreVal)

            validated = true
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .normal)
        } else {
            validated = false
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .disabled)
        }
    }
    
    @IBAction func textFieldKilometresChanged(_ sender: UITextField) {
        
        // Validating the Input
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.Kilometre) {
            
            // Retriving Precision setting
            prec = UserDefaults.standard.string(forKey: "precision_decimals")  ?? "2"
            
            let doubleVal = Double(sender.text!)!
            let metreValStruct = Metre(kilometres: doubleVal)
            
            // Conversion
            let milesValStruct = metreValStruct.toMile()
            
            let inchesValStruct = metreValStruct.toInch()
            
            let yardsValStruct = metreValStruct.toYard()
            
            let milesVal = UnitAppUtils.resultRound(milesValStruct.valueMile, precision: prec)
            let inchesVal = UnitAppUtils.resultRound(inchesValStruct.valueInch, precision: prec)
            let yardsVal = UnitAppUtils.resultRound(yardsValStruct.valueYards, precision: prec)
            
            let millimetreVal = UnitAppUtils.resultRound(metreValStruct.valueMillimetre, precision: prec)
            let centimetreVal = UnitAppUtils.resultRound(metreValStruct.valueCentimetre, precision: prec)
            let metreVal = UnitAppUtils.resultRound(metreValStruct.valueMetre, precision: prec)
            
            
            // Displaying Output answers in UI
            textFieldMiles.text = String(milesVal)
            textFieldYards.text = String(yardsVal)
            textFieldInches.text = String(inchesVal)
            
            textFieldMillimetres.text = String(millimetreVal)
            textFieldCentimetres.text = String(centimetreVal)
            textFieldMetres.text = String(metreVal)

            validated = true
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .normal)
        } else {
            validated = false
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .disabled)
        }
    }
    
    @IBAction func textFieldMilesChanged(_ sender: UITextField) {
        
        // Validating the Input
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.Mile) {
            
            // Retriving Precision setting
            prec = UserDefaults.standard.string(forKey: "precision_decimals")  ?? "2"
            
            let doubleVal = Double(sender.text!)!
            let mileValStruct = Mile(miles: doubleVal)
            
            // Conversion
            let metreValStruct = mileValStruct.toMetre()
            
            let inchesValStruct = mileValStruct.toInch()
            
            let yardsValStruct = mileValStruct.toYard()
            
            let metreVal = UnitAppUtils.resultRound(metreValStruct.valueMetre, precision: prec)
            let inchesVal = UnitAppUtils.resultRound(inchesValStruct.valueInch, precision: prec)
            let yardsVal = UnitAppUtils.resultRound(yardsValStruct.valueYards, precision: prec)
            
            let millimetreVal = UnitAppUtils.resultRound(metreValStruct.valueMillimetre, precision: prec)
            let cenimetreVal = UnitAppUtils.resultRound(metreValStruct.valueCentimetre, precision: prec)
            let kilometreVal = UnitAppUtils.resultRound(metreValStruct.valueKilometre, precision: prec)
            
            
            // Displaying Output answers in UI
            textFieldYards.text = String(yardsVal)
            textFieldInches.text = String(inchesVal)
            
            textFieldMillimetres.text = String(millimetreVal)
            textFieldMetres.text = String(metreVal)
            textFieldKilometres.text = String(kilometreVal)
            textFieldCentimetres.text = String(cenimetreVal)

            validated = true
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .normal)
        } else {
            validated = false
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .disabled)
        }
    }
    
    @IBAction func textFieldCentimetresChanged(_ sender: UITextField) {
        
        // Validating the Input
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.Centimetre) {
            
            // Retriving Precision setting
            prec = UserDefaults.standard.string(forKey: "precision_decimals")  ?? "2"
            
            let doubleVal = Double(sender.text!)!
            let metreValStruct = Metre(centimetres: doubleVal)
            
            // Conversion
            let milesValStruct = metreValStruct.toMile()
            
            let inchesValStruct = metreValStruct.toInch()
            
            let yardsValStruct = metreValStruct.toYard()
            
            let milesVal = UnitAppUtils.resultRound(milesValStruct.valueMile, precision: prec)
            let inchesVal = UnitAppUtils.resultRound(inchesValStruct.valueInch, precision: prec)
            let yardsVal = UnitAppUtils.resultRound(yardsValStruct.valueYards, precision: prec)
            
            let millimetreVal = UnitAppUtils.resultRound(metreValStruct.valueMillimetre, precision: prec)
            let metreVal = UnitAppUtils.resultRound(metreValStruct.valueMetre, precision: prec)
            let kilometreVal = UnitAppUtils.resultRound(metreValStruct.valueKilometre, precision: prec)
            
            
            // Displaying Output answers in UI
            textFieldMiles.text = String(milesVal)
            textFieldYards.text = String(yardsVal)
            textFieldInches.text = String(inchesVal)
            
            textFieldMillimetres.text = String(millimetreVal)
            textFieldMetres.text = String(metreVal)
            textFieldKilometres.text = String(kilometreVal)

            validated = true
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .normal)
        } else {
            validated = false
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .disabled)
        }
    }
    
    @IBAction func textFieldMillimetresChanged(_ sender: UITextField) {
        
        // Validating the Input
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.Millilitre) {
            
            // Retriving Precision setting
            prec = UserDefaults.standard.string(forKey: "precision_decimals")  ?? "2"
            
            let doubleVal = Double(sender.text!)!
            let metreValStruct = Metre(millimetres: doubleVal)
            
            // Conversion
            let milesValStruct = metreValStruct.toMile()
            
            let inchesValStruct = metreValStruct.toInch()
            
            let yardsValStruct = metreValStruct.toYard()
            
            let milesVal = UnitAppUtils.resultRound(milesValStruct.valueMile, precision: prec)
            let inchesVal = UnitAppUtils.resultRound(inchesValStruct.valueInch, precision: prec)
            let yardsVal = UnitAppUtils.resultRound(yardsValStruct.valueYards, precision: prec)
            
            let centimetreVal = UnitAppUtils.resultRound(metreValStruct.valueCentimetre, precision: prec)
            let metreVal = UnitAppUtils.resultRound(metreValStruct.valueMetre, precision: prec)
            let kilometreVal = UnitAppUtils.resultRound(metreValStruct.valueKilometre, precision: prec)
            
            
            // Displaying Output answers in UI
            textFieldMiles.text = String(milesVal)
            textFieldYards.text = String(yardsVal)
            textFieldInches.text = String(inchesVal)
            
            textFieldCentimetres.text = String(centimetreVal)
            textFieldMetres.text = String(metreVal)
            textFieldKilometres.text = String(kilometreVal)

            validated = true
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .normal)
        } else {
            validated = false
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .disabled)
        }
    }
    
    @IBAction func textFieldYardsChanged(_ sender: UITextField) {
        
        // Validating the Input
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.Mile) {
            
            // Retriving Precision setting
            prec = UserDefaults.standard.string(forKey: "precision_decimals")  ?? "2"
            
            let doubleVal = Double(sender.text!)!
            let yardValStruct = Yard(yards: doubleVal)
            
            // Conversion
            let metreValStruct = yardValStruct.toMetre()
            
            let inchesValStruct = yardValStruct.toInch()
            
            let milesValStruct = yardValStruct.toMile()
            
            let metreVal = UnitAppUtils.resultRound(metreValStruct.valueMetre, precision: prec)
            let inchesVal = UnitAppUtils.resultRound(inchesValStruct.valueInch, precision: prec)
            let milesVal = UnitAppUtils.resultRound(milesValStruct.valueMile, precision: prec)
            
            let millimetreVal = UnitAppUtils.resultRound(metreValStruct.valueMillimetre, precision: prec)
            let cenimetreVal = UnitAppUtils.resultRound(metreValStruct.valueCentimetre, precision: prec)
            let kilometreVal = UnitAppUtils.resultRound(metreValStruct.valueKilometre, precision: prec)
            
            // Displaying Output answers in UI
            textFieldMiles.text = String(milesVal)
            textFieldInches.text = String(inchesVal)
            
            textFieldMillimetres.text = String(millimetreVal)
            textFieldMetres.text = String(metreVal)
            textFieldKilometres.text = String(kilometreVal)
            textFieldCentimetres.text = String(cenimetreVal)

            validated = true
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .normal)
        } else {
            validated = false
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .disabled)
        }
    }
    
    @IBAction func textFieldInchesChanged(_ sender: UITextField) {
        
        // Validating the Input
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.Mile) {
            
            // Retriving Precision setting
            prec = UserDefaults.standard.string(forKey: "precision_decimals")  ?? "2"
            
            let doubleVal = Double(sender.text!)!
            let inchesValStruct = Inch(inches: doubleVal)
            
            // Conversion
            let metreValStruct = inchesValStruct.toMetre()
            
            let yardsValStruct = inchesValStruct.toYard()
            
            let milesValStruct = inchesValStruct.toMile()
            
            let metreVal = UnitAppUtils.resultRound(metreValStruct.valueMetre, precision: prec)
            let yardsVal = UnitAppUtils.resultRound(yardsValStruct.valueYards, precision: prec)
            let milesVal = UnitAppUtils.resultRound(milesValStruct.valueMile, precision: prec)
            
            let millimetreVal = UnitAppUtils.resultRound(metreValStruct.valueMillimetre, precision: prec)
            let cenimetreVal = UnitAppUtils.resultRound(metreValStruct.valueCentimetre, precision: prec)
            let kilometreVal = UnitAppUtils.resultRound(metreValStruct.valueKilometre, precision: prec)
            
            // Displaying Output answers in UI
            textFieldMiles.text = String(milesVal)
            textFieldYards.text = String(yardsVal)
            
            textFieldMillimetres.text = String(millimetreVal)
            textFieldMetres.text = String(metreVal)
            textFieldKilometres.text = String(kilometreVal)
            textFieldCentimetres.text = String(cenimetreVal)

            validated = true
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .normal)
        } else {
            validated = false
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .disabled)
        }
    }
    
    
    
    
    
    
    
    
    // Graying the TextFields that are not active
    @IBAction func textFieldEditEnded(_ sender: UITextField) {
        sender.layer.borderColor = UIColor.systemGray.cgColor
    }
    
    // Save Button Handling
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        if validated {
            sender.setTitle("Saved", for: .disabled)
            sender.isEnabled = false
            saveHistory()
        }
    }
    
    
    // Preparing the history view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Create a new variable to store the instance of PlayerTableViewController
        if let historyViewController = segue.destination as? HistoryViewController {
            historyViewController.historyEntries = UnitAppUtils.historyEntriesLength
            historyViewController.key = key
            
        }
    }
    
    
    // Generating the History entry to be saved
    func saveHistory() {
        var historyEntry = "Length: "
        historyEntry += "\( textFieldMetres.text ?? "er" ) m|"
        historyEntry += "\( textFieldKilometres.text ?? "er" ) km|"
        historyEntry += "\( textFieldMiles.text ?? "er" ) mi|"
        historyEntry += "\( textFieldCentimetres.text ?? "er" ) cm|"
        historyEntry += "\( textFieldMillimetres.text ?? "er" ) mm|"
        historyEntry += "\( textFieldYards.text ?? "er" ) mm|"
        historyEntry += "\( textFieldInches.text ?? "er" ) in|"
 
        UnitAppUtils.saveHistory(historyEntries: &UnitAppUtils.historyEntriesLength, key:key, historyString: historyEntry)    }
    
    // Dismiss keyboard on endEditing
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

}
