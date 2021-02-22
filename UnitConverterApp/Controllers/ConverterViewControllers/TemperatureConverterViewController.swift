//
//  TemperatureConverterViewController.swift
//  UnitConverterApp
//
//  Created by Rammuni Ravidu Suien Silva on 2021-02-07.
//

import UIKit

// ViewController for Temperature Converter
class TemperatureConverterViewController: UIViewController {
    
    private var prec = "0"
    var validated = false
    
    
    // Outlets for the UI elements
    @IBOutlet weak var buttonSave: UIButton!
    @IBOutlet weak var textFieldCelsius: UITextField!
    @IBOutlet weak var textFieldKelvin: UITextField!
    @IBOutlet weak var textFieldFahrenheit: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Temperature"
        
        prec = UserDefaults.standard.string(forKey: "precision_decimals") ?? "2" // Nil coalescing

        // Setting Precision
        UserDefaults.standard.string(forKey: "precision_decimals")
       
        // UI setup
        
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
        
        // Synchronizing the History Data
        UnitAppUtils.syncHistoryData()

    }
    

    // TextField EditingChanged Functions
    
    @IBAction func textFieldCelsiusChanged(_ sender: UITextField) {
        
        // Validating the Input
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.Celsius) {
            
            // Retriving Precision setting
            prec = UserDefaults.standard.string(forKey: "precision_decimals")  ?? "2"

            
            let doubleVal = Double(sender.text!)!
            let celsiusValStruct = Celsius(celsius: doubleVal)
            
            // Conversion
            let kelvinValStruct = celsiusValStruct.toKelvin()
            
            let fahrenheitValStruct = celsiusValStruct.toFahrenheit()
            
            let kelvinVal = UnitAppUtils.resultRound(kelvinValStruct.valueKelvin, precision: prec)
            let fahrenheitVal = UnitAppUtils.resultRound(fahrenheitValStruct.valueFahrenheit, precision: prec)
            
            // Displaying Output answers in UI
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
        
        // Validating the Input
        if UnitAppUtils.validateTextFieldInput(textFieldIn: sender, inputUnit: Units.Kelvin) {
            
            // Retriving Precision setting
            prec = UserDefaults.standard.string(forKey: "precision_decimals")  ?? "2"

            
            let doubleVal = Double(sender.text!)!
            let kelvinValStruct = Kelvin (kelvin: doubleVal)

            
            // Conversion
            let celsiusValStruct = kelvinValStruct.toCelsius()
            
            let fahrenheitValStruct = kelvinValStruct.toFahrenheit()
            
            let celsiusVal = UnitAppUtils.resultRound(celsiusValStruct.valueCelsius, precision: prec)
            let fahrenheitVal = UnitAppUtils.resultRound(fahrenheitValStruct.valueFahrenheit, precision: prec)
            
            // Displaying Output answers in UI
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
    
    
    // Generating the History entry to be saved
    func saveHistory() {
        var historyEntry = "Temperature: "
        historyEntry += "\( textFieldCelsius.text ?? "er" ) °C|"
        historyEntry += "\( textFieldKelvin.text ?? "er" ) K|"
        historyEntry += "\( textFieldFahrenheit.text ?? "er" ) °F|"

        UnitAppUtils.saveHistory(historyString: historyEntry)
    }
    
    // Dismiss keyboard on endEditing
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    

}
