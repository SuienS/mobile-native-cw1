//
//  SpeedConverterViewController.swift
//  UnitConverterApp
//
//  Created by Rammuni Ravidu Suien Silva on 2021-02-07.
//

import UIKit

// ViewController for Speed Converter
class SpeedConverterViewController: UIViewController {

    private var prec = "0"
    var validated = false
        
    // Key for UserDefaults history data
    var key = "historyEntriesSpeed"
    
    
    // Outlets for the UI elements
    @IBOutlet weak var buttonSave: UIButton!
    @IBOutlet weak var textFieldMPS: UITextField!
    @IBOutlet weak var textFieldKMPH: UITextField!
    @IBOutlet weak var textFieldMPH: UITextField!
    @IBOutlet weak var textFieldKnots: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Speed"
        
        prec = UserDefaults.standard.string(forKey: "precision_decimals") ?? "2" // Nil coalescing

        // Setting Precision
        UserDefaults.standard.string(forKey: "precision_decimals")
        
        // UI setup
        
        buttonSave.isEnabled = false
        
        textFieldMPS.text = "0"
        textFieldKMPH.text = "0"
        textFieldMPH.text = "0"
        textFieldKnots.text = "0"


        textFieldMPS.layer.borderWidth = 1.0
        textFieldMPS.layer.cornerRadius = 10.0
        textFieldKMPH.layer.borderWidth = 1.0
        textFieldKMPH.layer.cornerRadius = 10.0
        textFieldMPH.layer.borderWidth = 1.0
        textFieldMPH.layer.cornerRadius = 10.0
        textFieldKnots.layer.borderWidth = 1.0
        textFieldKnots.layer.cornerRadius = 10.0
        
        
        textFieldMPS.layer.borderColor = UIColor.systemGray.cgColor
        textFieldKMPH.layer.borderColor = UIColor.systemGray.cgColor
        textFieldMPH.layer.borderColor = UIColor.systemGray.cgColor
        textFieldKnots.layer.borderColor = UIColor.systemGray.cgColor
       
        // Synchronizing the History Data
        UnitAppUtils.syncHistoryData(historyEntries: &UnitAppUtils.historyEntriesSpeed, key: key)
    }
    
    // TextField EditingChanged Functions
    
    @IBAction func textFieldMPSChanged(_ sender: UITextField) {
        
        // Validating the Input
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.MPS) {
            
            // Retriving Precision setting
            prec = UserDefaults.standard.string(forKey: "precision_decimals")  ?? "2"
            
            let doubleVal = Double(sender.text!)!
            let mpsValStruct = MPS(mps: doubleVal)
            
            // Conversion
            let kmphValStruct = mpsValStruct.toKMPH()
            
            let mphValStruct = mpsValStruct.toMPH()
            
            let knotsValStruct = mpsValStruct.toKnot()
            
            let kmphVal = UnitAppUtils.resultRound(kmphValStruct.valueKMPH, precision: prec)
            let mphVal = UnitAppUtils.resultRound(mphValStruct.valueMPH, precision: prec)
            let knotVal = UnitAppUtils.resultRound(knotsValStruct.valueKnot, precision: prec)

            // Displaying Output answers in UI
            textFieldKMPH.text = String(kmphVal)
            textFieldMPH.text = String(mphVal)
            textFieldKnots.text = String(knotVal)


            validated = true
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .normal)
        } else {
            validated = false
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .disabled)
        }
        
    }
    

    
    @IBAction func textFieldKMPHChanged(_ sender: UITextField) {
        
        // Validating the Input
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.KMPH) {
            
            // Retriving Precision setting
            prec = UserDefaults.standard.string(forKey: "precision_decimals")  ?? "2"
            
            let doubleVal = Double(sender.text!)!
            let kmphValStruct = KMPH(kmph: doubleVal)
            
            // Conversion
            let mpsValStruct = kmphValStruct.toMPS()
            
            let mphValStruct = kmphValStruct.toMPH()
            
            let knotsValStruct = kmphValStruct.toKnot()
            
            let mpsVal = UnitAppUtils.resultRound(mpsValStruct.valueMPS, precision: prec)
            let mphVal = UnitAppUtils.resultRound(mphValStruct.valueMPH, precision: prec)
            let knotVal = UnitAppUtils.resultRound(knotsValStruct.valueKnot, precision: prec)

            
            // Displaying Output answers in UI
            textFieldMPS.text = String(mpsVal)
            textFieldMPH.text = String(mphVal)
            textFieldKnots.text = String(knotVal)


            validated = true
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .normal)
        } else {
            validated = false
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .disabled)
        }
    }
    
    @IBAction func textFieldMPHChanged(_ sender: UITextField) {
        
        // Validating the Input
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.MPH) {
            
            // Retriving Precision setting
            prec = UserDefaults.standard.string(forKey: "precision_decimals")  ?? "2"
            
            let doubleVal = Double(sender.text!)!
            let mphValStruct = MPH(mph: doubleVal)
            
            // Conversion
            let mpsValStruct = mphValStruct.toMPS()
            
            let kmphValStruct = mphValStruct.toKMPH()
            
            let knotsValStruct = mphValStruct.toKnot()
            
            let mpsVal = UnitAppUtils.resultRound(mpsValStruct.valueMPS, precision: prec)
            let kmphVal = UnitAppUtils.resultRound(kmphValStruct.valueKMPH, precision: prec)
            let knotVal = UnitAppUtils.resultRound(knotsValStruct.valueKnot, precision: prec)

            // Displaying Output answers in UI
            textFieldMPS.text = String(mpsVal)
            textFieldKMPH.text = String(kmphVal)
            textFieldKnots.text = String(knotVal)


            validated = true
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .normal)
        } else {
            validated = false
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .disabled)
        }
        
    }
    
    @IBAction func textFieldKnotsChanged(_ sender: UITextField) {
        
        // Validating the Input
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.Knot) {
            
            
            // Retriving Precision setting
            prec = UserDefaults.standard.string(forKey: "precision_decimals")  ?? "2"
            
            let doubleVal = Double(sender.text!)!
            let knotsValStruct = Knot(knots: doubleVal)
            
            // Conversion
            let mpsValStruct = knotsValStruct.toMPS()
            
            let kmphValStruct = knotsValStruct.toKMPH()
            
            let mphValStruct = knotsValStruct.toMPH()
            
            let mpsVal = UnitAppUtils.resultRound(mpsValStruct.valueMPS, precision: prec)
            let kmphVal = UnitAppUtils.resultRound(kmphValStruct.valueKMPH, precision: prec)
            let mphVal = UnitAppUtils.resultRound(mphValStruct.valueMPH, precision: prec)

            // Displaying Output answers in UI
            textFieldMPS.text = String(mpsVal)
            textFieldKMPH.text = String(kmphVal)
            textFieldMPH.text = String(mphVal)


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
            historyViewController.historyEntries = UnitAppUtils.historyEntriesSpeed
            historyViewController.key = key
            
        }
    }
    
    
    // Generating the History entry to be saved
    func saveHistory() {
        var historyEntry = "Speed: "
        historyEntry += "\( textFieldMPS.text ?? "er" ) ms⁻¹|"
        historyEntry += "\( textFieldKMPH.text ?? "er" ) kmh⁻¹|"
        historyEntry += "\( textFieldMPH.text ?? "er" ) mih⁻¹|"
        historyEntry += "\( textFieldKnots.text ?? "er" ) knots|"
 
        UnitAppUtils.saveHistory(historyEntries: &UnitAppUtils.historyEntriesSpeed, key:key, historyString: historyEntry)    }
    
    // Dismiss keyboard on endEditing
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

}
