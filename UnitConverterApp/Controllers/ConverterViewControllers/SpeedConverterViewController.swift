//
//  SpeedConverterViewController.swift
//  UnitConverterApp
//
//  Created by Rammuni Ravidu Suien Silva on 2021-02-07.
//

import UIKit

class SpeedConverterViewController: UIViewController {

    private var prec = "0"
    var validated = false
    
    @IBOutlet weak var buttonSave: UIButton!
    @IBOutlet weak var textFieldMPS: UITextField!
    @IBOutlet weak var textFieldKMPH: UITextField!
    @IBOutlet weak var textFieldMPH: UITextField!
    @IBOutlet weak var textFieldKnots: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Speed"
        
        prec = UserDefaults.standard.string(forKey: "precision_decimals") ?? "2" // Nil coalescing

        UserDefaults.standard.string(forKey: "precision_decimals")
        
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
       
        UnitAppUtils.syncHistoryData()

    }
    
    @IBAction func textFieldMPSChanged(_ sender: UITextField) {
        
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.MPS) {
            
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
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.KMPH) {
            
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
        
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.MPH) {
            
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
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.Knot) {
            
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
        var historyEntry = "Speed: "
        historyEntry += "\( textFieldMPS.text ?? "er" ) ms⁻¹|"
        historyEntry += "\( textFieldKMPH.text ?? "er" ) kmh⁻¹|"
        historyEntry += "\( textFieldMPH.text ?? "er" ) mih⁻¹|"
        historyEntry += "\( textFieldKnots.text ?? "er" ) knots|"
 
        UnitAppUtils.saveHistory(historyString: historyEntry)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

}
