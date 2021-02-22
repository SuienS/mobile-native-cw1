//
//  UnitAppUtils.swift
//  UnitConverterApp
//
//  Created by Rammuni Ravidu Suien Silva on 2021-02-15.
//

// Contains the support methods needed throughout the app
import UIKit
class UnitAppUtils{
    
    static var historyEntries: [HistoryEntry] = []
    
    // Function vaidation of the all the unit input fields
    // Valid   -> Highlights in BLUE
    // Invalid -> Highlights in RED
    static func validateTextFieldInput(textFieldIn tf_in: UITextField, inputUnit c_unit: Units )->Bool{
        
        switch c_unit {
        case .Grams, .Kilograms, .Pounds, .Kelvin, .Metre, .Centimetre, .Millimetre, .Kilometre, .Mile, .Yard, .Inch, .MPS, .KMPH, .MPH, .Knot, .GallonUK, .Litre, .PintUK, .FluidOunce, .Millilitre:
            let doubleVal = Double(tf_in.text!)
            if doubleVal != nil , doubleVal! >= 0 { //Optionals For validation
                tf_in.layer.borderColor = UIColor.systemBlue.cgColor
                return true
            } else {
                tf_in.layer.borderColor = UIColor.systemRed.cgColor
                return false
            }
            
        case .Stone_Pounds_St:
            let intVal = Int(tf_in.text!)
            if intVal != nil , intVal! >= 0 { //Optionals For validation
                tf_in.layer.borderColor = UIColor.systemBlue.cgColor
                return true
            } else {
                tf_in.layer.borderColor = UIColor.systemRed.cgColor
                return false
            }
        case .Stone_Pounds_Lbs:
            let intVal = Int(tf_in.text!)
            if intVal != nil , ((intVal!) <= 13), ((intVal!) >= 0) { //Optionals For validation
                tf_in.layer.borderColor = UIColor.systemBlue.cgColor
                return true
            } else {
                tf_in.layer.borderColor = UIColor.systemRed.cgColor
                return false
            }
        case .Celsius:
            let doubleVal = Double(tf_in.text!)
            if doubleVal != nil , doubleVal! >= -273.15 { //Optionals For validation
                tf_in.layer.borderColor = UIColor.systemBlue.cgColor
                return true
            } else {
                tf_in.layer.borderColor = UIColor.systemRed.cgColor
                return false
            }
        case .Fahrenheit:
            let doubleVal = Double(tf_in.text!)
            if doubleVal != nil , doubleVal! >= -459.67 { //Optionals For validation
                tf_in.layer.borderColor = UIColor.systemBlue.cgColor
                return true
            } else {
                tf_in.layer.borderColor = UIColor.systemRed.cgColor
                return false
            }
        }
    }
    
    // Rounding Method
    static func resultRound(_ val_d: Double,
        precision dec_Count: String ) -> Double
    {
        switch dec_Count {
        case "0":
            return round(val_d)
        case "1":
            return round(val_d * pow(10, 1)) / pow(10, 1)
        case "2":
            return round(val_d * pow(10, 2)) / pow(10, 2)
        case "3":
            return round(val_d * pow(10, 3)) / pow(10, 3)
        case "4":
            return round(val_d * pow(10, 4)) / pow(10, 4)
        case "5":
            return round(val_d * pow(10, 5)) / pow(10, 5)
        case "6":
            return round(val_d * pow(10, 6)) / pow(10, 6)
        default: return val_d
        }
    }
    
    // Handling the save button in proper states accordingly
    static func saveButtonState(saveButton s_btn: UIButton ,state: UIControl.State){
        
        switch state {
        case .normal:
            s_btn.setTitle("Save", for: .normal)
            s_btn.isEnabled = true
        
        case .disabled:
            s_btn.setTitle("Save", for: .disabled)
            s_btn.isEnabled = false
        default:
            s_btn.isEnabled = false
        }
        
    }
    
    // Serializing History model to the user deafaults data
    static func saveHistory(historyString h_str: String){
        let historyEntry: HistoryEntry = HistoryEntry(historyString: h_str)
        
        // FIFO
        if historyEntries.count >= 5 {
            historyEntries.remove(at: 0)
        }
        historyEntries.append(historyEntry)
        
        let userDefaults = UserDefaults.standard
        
        // Converting to JSON
        let encJSON = JSONEncoder()
        
        if let encHistory = try? encJSON.encode(historyEntries) {
            userDefaults.set(encHistory, forKey: "historyEntries")
        }
    }
    
    // Achieving Data Persistency
    // Synchronization of the saved data
    static func syncHistoryData() {
        let decJSON = JSONDecoder()
        let userDefaults = UserDefaults.standard
        
        if let history = userDefaults.object(forKey: "historyEntries") as? Data {
            if let history = try? decJSON.decode([HistoryEntry].self, from: history) {
                historyEntries = history
            }
            
        }
    }
}
