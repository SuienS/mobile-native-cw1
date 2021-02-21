//
//  LengthConverterViewController.swift
//  UnitConverterApp
//
//  Created by Rammuni Ravidu Suien Silva on 2021-02-07.
//

import UIKit

class WeightConverterViewController: UIViewController {
    
    private var prec = "0"
    var validated = false
    
    @IBOutlet weak var buttonSave: UIButton!
    @IBOutlet weak var textFieldGrams: UITextField!
    @IBOutlet weak var textFieldKilograms: UITextField!
    @IBOutlet weak var textFieldPounds: UITextField!
    @IBOutlet weak var textFieldStonePounds_st: UITextField!
    @IBOutlet weak var textFieldStonePounds_lbs: UITextField!
    
    // TRY TO USE LAZY VARS TOO!!!!!!!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Weight"
        prec = UserDefaults.standard.string(forKey: "precision_decimals") ?? "2" // Nil coalescing

        UserDefaults.standard.string(forKey: "precision_decimals")
        
        buttonSave.isEnabled = false
        
        textFieldGrams.text = "0"
        textFieldKilograms.text = "0"
        textFieldPounds.text = "0"
        textFieldStonePounds_lbs.text = "0"
        textFieldStonePounds_st.text = "0"
        
        textFieldGrams.layer.borderWidth = 1.0
        textFieldGrams.layer.cornerRadius = 10.0
        textFieldKilograms.layer.borderWidth = 1.0
        textFieldKilograms.layer.cornerRadius = 10.0
        textFieldPounds.layer.borderWidth = 1.0
        textFieldPounds.layer.cornerRadius = 10.0
        textFieldStonePounds_st.layer.borderWidth = 1.0
        textFieldStonePounds_st.layer.cornerRadius = 10.0
        textFieldStonePounds_lbs.layer.borderWidth = 1.0
        textFieldStonePounds_lbs.layer.cornerRadius = 10.0
        
        textFieldGrams.layer.borderColor = UIColor.systemGray.cgColor
        textFieldKilograms.layer.borderColor = UIColor.systemGray.cgColor
        textFieldPounds.layer.borderColor = UIColor.systemGray.cgColor
        textFieldStonePounds_st.layer.borderColor = UIColor.systemGray.cgColor
        textFieldStonePounds_lbs.layer.borderColor = UIColor.systemGray.cgColor
        
        UnitAppUtils.syncHistoryData()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func textFieldGramsChanged(_ sender: UITextField) {
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.Grams) {
            
            prec = UserDefaults.standard.string(forKey: "precision_decimals")  ?? "2"

            
            let doubleVal = Double(sender.text!)!
            let gramsValStruct = Kilograms(grams: doubleVal)
            
            // Conversion
            let poundsValStruct = gramsValStruct.toPounds()
            
            let kilogramsVal = UnitAppUtils.resultRound(gramsValStruct.valueKilograms, precision: prec)
            let poundsVal = UnitAppUtils.resultRound(poundsValStruct.valuePounds, precision: prec)
            let stPoundsVal_st = poundsValStruct.valueStPounds_st
            let stPoundsVal_lbs = poundsValStruct.valueStPounds_lbs
            
            
            textFieldKilograms.text = String(kilogramsVal)
            textFieldPounds.text = String(poundsVal)
            textFieldStonePounds_st.text = String(stPoundsVal_st)
            textFieldStonePounds_lbs.text = String(stPoundsVal_lbs)
            
            validated = true
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .normal)
            
        } else {
            validated = false
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .disabled)
        }
    }
    
    
    @IBAction func textFieldKilogramsChanged(_ sender: UITextField) {
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.Kilograms) {
            
            prec = UserDefaults.standard.string(forKey: "precision_decimals")  ?? "2"
            
            let doubleVal = Double(sender.text!)!
            let kilogramsValStruct = Kilograms(kilograms: doubleVal)
            
            // Conversion
            let poundsValStruct = kilogramsValStruct.toPounds()
            
            let gramsVal = UnitAppUtils.resultRound(kilogramsValStruct.valueGrams, precision: prec)
            let poundsVal = UnitAppUtils.resultRound(poundsValStruct.valuePounds, precision: prec)
            let stPoundsVal_st = poundsValStruct.valueStPounds_st
            let stPoundsVal_lbs = poundsValStruct.valueStPounds_lbs
            
            
            textFieldGrams.text = String(gramsVal)
            textFieldPounds.text = String(poundsVal)
            textFieldStonePounds_st.text = String(stPoundsVal_st)
            textFieldStonePounds_lbs.text = String(stPoundsVal_lbs)
            
            validated = true
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .normal)
        } else {
            validated = false
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .disabled)
        }
    }
    
    @IBAction func textFieldPoundsChanged(_ sender: UITextField) {
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.Pounds) {
            
            prec = UserDefaults.standard.string(forKey: "precision_decimals")  ?? "2"

            
            let doubleVal = Double(sender.text!)!
            let poundsValStruct = Pounds(pounds: doubleVal)
            
            // Conversion
            let kilogramsValStruct = poundsValStruct.toKilograms()
            
            let gramsVal = UnitAppUtils.resultRound(kilogramsValStruct.valueGrams, precision: prec)
            let kilogramsVal = UnitAppUtils.resultRound(kilogramsValStruct.valueKilograms, precision: prec)
            let stPoundsVal_st = poundsValStruct.valueStPounds_st
            let stPoundsVal_lbs = poundsValStruct.valueStPounds_lbs
            
            
            textFieldGrams.text = String(gramsVal)
            textFieldKilograms.text = String(kilogramsVal)
            textFieldStonePounds_st.text = String(stPoundsVal_st)
            textFieldStonePounds_lbs.text = String(stPoundsVal_lbs)
            
            validated = true
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .normal)
        } else {
            validated = false
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .disabled)
        }
    }
    
    @IBAction func textFieldsStPoundsChanged(_ sender: UITextField) {
        if UnitAppUtils.validateTextFieldInput(textFieldIn: textFieldStonePounds_st, inputUnit: Units.Stone_Pounds_St), UnitAppUtils.validateTextFieldInput(textFieldIn: textFieldStonePounds_lbs, inputUnit: Units.Stone_Pounds_Lbs) {
            
            prec = UserDefaults.standard.string(forKey: "precision_decimals")  ?? "2"

            
            let intVal_st = Int(textFieldStonePounds_st.text!)!
            let intVal_lbs = Int(textFieldStonePounds_lbs.text!)!
            let poundsValStruct = Pounds(pounds_st: intVal_st, pounds_lbs: intVal_lbs)
            
            // Conversion
            let kilogramsValStruct = poundsValStruct.toKilograms()
            
            let gramsVal = UnitAppUtils.resultRound(kilogramsValStruct.valueGrams, precision: prec)
            let kilogramsVal = UnitAppUtils.resultRound(kilogramsValStruct.valueKilograms, precision: prec)
            let poundsVal = UnitAppUtils.resultRound(poundsValStruct.valuePounds, precision: prec)
            
            
            
            textFieldGrams.text = String(gramsVal)
            textFieldKilograms.text = String(kilogramsVal)
            textFieldPounds.text = String(poundsVal)
            
            validated = true
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .normal)
            
        } else {
            validated = false
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .disabled)
        }
    }
    
    
    
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
        var historyEntry = "Weight: "
        historyEntry += "\( textFieldGrams.text ?? "er" ) g|"
        historyEntry += "\( textFieldKilograms.text ?? "er" ) Kg|"
        historyEntry += "\( textFieldPounds.text ?? "er" ) lbs|"
        historyEntry += "\( textFieldStonePounds_st.text ?? "er" ) st \(textFieldStonePounds_lbs.text ?? "er") lbs|"
        UnitAppUtils.saveHistory(historyString: historyEntry)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    // TODO: Add error label to UI

    
    
}


