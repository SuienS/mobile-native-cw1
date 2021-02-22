//
//  TemperatureUnits.swift
//  UnitConverterApp
//
//  Created by Rammuni Ravidu Suien Silva on 2021-02-14.
//


// Contains the Structures for the Temperature Units
import Foundation

// Structure for Celsius
struct Celsius {
    
    private var celsiusValue: Double = 0.0
    
    init(celsius val_c: Double) {
        self.celsiusValue = val_c
    }
    
    // Encapsulation
    var valueCelsius: Double{
        self.celsiusValue
    }
    
    
    // Conversion
    func toKelvin() -> Kelvin {
        return Kelvin(kelvin: (celsiusValue + Constants.CelsiusToKelvin))
    }
    
    func toFahrenheit() -> Fahrenheit {
        return Fahrenheit(fahrenheit: ((celsiusValue * Constants.CelsiusToFahrenheit_mul) + Constants.CelsiusToFahrenheit_add))
    }
    
    
}


// Structure fot Kelvin
struct Kelvin {
    private var kelvinValue: Double = 0.0
    
    init(kelvin val_k: Double) {
        self.kelvinValue = val_k
    }
    
    // Encapsulation
    var valueKelvin: Double {
        return self.kelvinValue
    }
    
    
    // Conversions
    func toCelsius() -> Celsius {
        return Celsius(celsius: (kelvinValue - Constants.CelsiusToKelvin))
    }
    
    func toFahrenheit() -> Fahrenheit {
        return Fahrenheit(fahrenheit: (((kelvinValue - Constants.CelsiusToKelvin) * Constants.CelsiusToFahrenheit_mul) + Constants.CelsiusToFahrenheit_add))
    }
    
}


// Structure for Fahrenheit
struct Fahrenheit {
    
    private var fahrenheitValue: Double = 0.0
    
    init(fahrenheit val_f: Double){
        self.fahrenheitValue = val_f
    }
    
    // Encapsulation
    var valueFahrenheit: Double {
        return self.fahrenheitValue
    }
    
    
    // Conversions
    func toCelsius() -> Celsius {
        return Celsius(celsius: ((fahrenheitValue - Constants.CelsiusToFahrenheit_add)/Constants.CelsiusToFahrenheit_mul))
    }
    
    func toKelvin() -> Kelvin {
        return Kelvin(kelvin: (((fahrenheitValue - Constants.CelsiusToFahrenheit_add)/Constants.CelsiusToFahrenheit_mul) + Constants.CelsiusToKelvin))
    }
    
}
