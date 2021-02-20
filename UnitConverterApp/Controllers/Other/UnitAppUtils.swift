//
//  UnitAppUtils.swift
//  UnitConverterApp
//
//  Created by Rammuni Ravidu Suien Silva on 2021-02-15.
//

import UIKit
class UnitAppUtils{
    
    static var historyEntries: [HistoryEntry] = []//Should be initialized at the begining of the app
    static var historyEntryIndex: Int = 0//Should be initialized at the begining of the app
    
    
    static func validateTextFieldInput(textFieldIn tf_in: UITextField, inputUnit c_unit: WeightUnits )->Bool{
        
        switch c_unit {
        case .Grams, .Kilograms, .Pounds:
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
        }
    }
    
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
    
    
    static func saveHistory(historyString h_str: String){
        let historyEntry: HistoryEntry = HistoryEntry(historyString: h_str)
        
        if historyEntries.count >= 5 {
            historyEntries.remove(at: 0)
        }
        historyEntries.append(historyEntry)
        
        let userDefaults = UserDefaults.standard
        
        let encJSON = JSONEncoder()
        
        if let encHistory = try? encJSON.encode(historyEntries) {
            userDefaults.set(encHistory, forKey: "historyEntries")
        }
        
        //let history
        print("====")
        for h in historyEntries {
            print(h.historyEntry)
        }
        print("====")
        // Save to UserDefaults
    }
    
    static func syncHistoryData() {
        let decJSON = JSONDecoder()
        let userDefaults = UserDefaults.standard
        
        if let history = userDefaults.object(forKey: "historyEntries") as? Data {
            if let history = try? decJSON.decode([HistoryEntry].self, from: history) {
                historyEntries = history
                print("=UserDEf===")
                for h in historyEntries {
                    print(h.historyEntry)
                }
                print("===========")
            }
            
        }
    }
    
}