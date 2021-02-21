//
//  TemperatureConverterViewController.swift
//  UnitConverterApp
//
//  Created by Rammuni Ravidu Suien Silva on 2021-02-07.
//

import UIKit

enum TemperatureUnits {
    case Celsius
    case Fahrenheit
    case Kelvin
}

class TemperatureConverterViewController: UIViewController {
    
    private var prec = "0"
    var validated = false
    
    @IBOutlet weak var buttonSave: UIButton!
    @IBOutlet weak var textFieldCelsius: UITextField!
    @IBOutlet weak var textFieldKelvin: UITextField!
    @IBOutlet weak var textFieldFahrenheit: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Temperature"
        
        prec = UserDefaults.standard.string(forKey: "precision_decimals") ?? "2" // Nil coalescing

        UserDefaults.standard.string(forKey: "precision_decimals")
        
        buttonSave.isEnabled = false
        
        textFieldCelsius.text = "0"
        textFieldKelvin.text = "0"
        textFieldFahrenheit.text = "0"

        
        textFieldCelsius.layer.borderWidth = 1.0
        textFieldCelsius.layer.cornerRadius = 10.0
        textFieldKelvin.layer.borderWidth = 1.0
        textFieldKelvin.layer.cornerRadius = 10.0
        textFieldFahrenheit.layer.borderWidth = 1.0
        textFieldFahrenheit.layer.cornerRadius = 10.0

        
        textFieldCelsius.layer.borderColor = UIColor.systemGray.cgColor
        textFieldKelvin.layer.borderColor = UIColor.systemGray.cgColor
        textFieldFahrenheit.layer.borderColor = UIColor.systemGray.cgColor
        
        UnitAppUtils.syncHistoryData()

    }
    
    
    @IBAction func textFieldCelsiusChanged(_ sender: UITextField) {
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.Celsius) {
            
            prec = UserDefaults.standard.string(forKey: "precision_decimals")  ?? "2"

            
            let doubleVal = Double(sender.text!)!
            let celsiusValStruct = Celsius(celsius: doubleVal)
            
            // Conversion
            let kelvinValStruct = celsiusValStruct.toKelvin()
            
            let fahrenheitValStruct = celsiusValStruct.toFahrenheit()
            
            let kelvinVal = UnitAppUtils.resultRound(kelvinValStruct.valueKelvin, precision: prec)
            let fahrenheitVal = UnitAppUtils.resultRound(fahrenheitValStruct.valueFahrenheit, precision: prec)
            
            
            textFieldKelvin.text = String(kelvinVal)
            textFieldFahrenheit.text = String(fahrenheitVal)
            
            validated = true
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .normal)
            
        } else {
            validated = false
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .disabled)
        }
    }
    
    @IBAction func textFieldKelvinChanged(_ sender: UITextField) {
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.Kelvin) {
            
            prec = UserDefaults.standard.string(forKey: "precision_decimals")  ?? "2"

            
            let doubleVal = Double(sender.text!)!
            let kelvinValStruct = Kelvin (kelvin: doubleVal)

            
            // Conversion
            let celsiusValStruct = kelvinValStruct.toCelsius()
            
            let fahrenheitValStruct = kelvinValStruct.toFahrenheit()
            
            let celsiusVal = UnitAppUtils.resultRound(celsiusValStruct.valueCelsius, precision: prec)
            let fahrenheitVal = UnitAppUtils.resultRound(fahrenheitValStruct.valueFahrenheit, precision: prec)
            
            
            textFieldCelsius.text = String(celsiusVal)
            textFieldFahrenheit.text = String(fahrenheitVal)
            
            validated = true
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .normal)
            
        } else {
            validated = false
            UnitAppUtils.saveButtonState(saveButton: buttonSave, state: .disabled)
        }
    }
    @IBAction func textFieldFahrenheitChanged(_ sender: UITextField) {
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.Fahrenheit) {
            
            prec = UserDefaults.standard.string(forKey: "precision_decimals")  ?? "2"

            
            let doubleVal = Double(sender.text!)!
            let fahrenheitValStruct = Fahrenheit(fahrenheit: doubleVal)

            
            // Conversion
            let celsiusValStruct = fahrenheitValStruct.toCelsius()
            
            let kelvinValStruct = fahrenheitValStruct.toKelvin()
            
            let celsiusVal = UnitAppUtils.resultRound(celsiusValStruct.valueCelsius, precision: prec)
            let kelvinVal = UnitAppUtils.resultRound(kelvinValStruct.valueKelvin, precision: prec)
            
            
            textFieldCelsius.text = String(celsiusVal)
            textFieldKelvin.text = String(kelvinVal)
            
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
        var historyEntry = "Temperature: "
        historyEntry += "\( textFieldCelsius.text ?? "er" ) °C|"
        historyEntry += "\( textFieldKelvin.text ?? "er" ) K|"
        historyEntry += "\( textFieldFahrenheit.text ?? "er" ) °F|"

        UnitAppUtils.saveHistory(historyString: historyEntry)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    

}
