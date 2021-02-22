//
//  LengthUnits.swift
//  UnitConverterApp
//
//  Created by Rammuni Ravidu Suien Silva on 2021-02-18.
//

// Contains the structures for length units
import Foundation


// Structure for Meter
struct Metre {
    private var metreValue: Double = 0.0
    private var kiloMetreValue: Double = 0.0
    private var centiMetreValue: Double = 0.0
    private var milliMetreValue: Double = 0.0

    init(metres val_m: Double) {
        self.metreValue = val_m
        self.centiMetreValue = val_m * 100.0
        self.kiloMetreValue = val_m / 1000.0
        self.milliMetreValue = val_m * 1000.0
    }
    
    init(kilometres val_km: Double) {
        self.metreValue = val_km * 1000.0
        self.centiMetreValue = val_km * 100000.0
        self.kiloMetreValue = val_km
        self.milliMetreValue = val_km * 1000000.0
    }
    
    init(centimetres val_cm: Double) {
        self.metreValue = val_cm / 100.0
        self.centiMetreValue = val_cm
        self.kiloMetreValue = val_cm / 100000.0
        self.milliMetreValue = val_cm * 10.0
    }
    
    init(millimetres val_mm: Double) {
        self.metreValue = val_mm / 1000.0
        self.centiMetreValue = val_mm / 10.0
        self.kiloMetreValue = val_mm / 1000000.0
        self.milliMetreValue = val_mm
    }
    
    // Encapsulation
    var valueMetre: Double{
        return self.metreValue
    }
    var valueCentimetre: Double{
        return self.centiMetreValue
    }
    var valueKilometre: Double{
        return self.kiloMetreValue
    }
    var valueMillimetre: Double{
        return self.milliMetreValue
    }
    
    
    // Conversions
    func toMile() -> Mile {
        return Mile(miles: metreValue * Constants.MetreToMile)
    }
    
    func toYard() -> Yard {
        return Yard(yards: metreValue * Constants.MetreToYard)
    }
    
    func toInch() -> Inch {
        return Inch(inches: metreValue * Constants.MetreToInch)
    }
    
}


// Structure for Mile
struct Mile {
    
    private var mileValue: Double = 0.0
    
    init(miles val_m: Double) {
        self.mileValue = val_m
    }
    
    // Encapsulation
    var valueMile: Double {
        return self.mileValue
    }
    
    
    // Conversions
    func toMetre() -> Metre {
        return Metre(metres: mileValue / Constants.MetreToMile)
    }
    
    func toYard() -> Yard {
        return Yard(yards: mileValue * Constants.MileToYard)
    }
    
    func toInch() -> Inch {
        return Inch(inches: mileValue * Constants.MileToInch)
    }
    
}


// Structure for Yard
struct Yard {
    
    private var yardsValue: Double = 0.0
    
    init(yards val_y: Double) {
        self.yardsValue = val_y
    }
    
    // Encapsulation
    var valueYards: Double {
        self.yardsValue
    }
    
    // Conversions
    func toMetre() -> Metre {
        return Metre(metres: yardsValue / Constants.MetreToYard)
    }
    
    func toMile() -> Mile {
        return Mile(miles: yardsValue / Constants.MileToYard)
    }
    
    func toInch() -> Inch {
        return Inch(inches: yardsValue * Constants.YardToInch)
    }
    
}


// Structure for inch
struct Inch {
    
    private var inchValue: Double = 0.0
    
    init(inches val_i: Double) {
        self.inchValue = val_i
    }
    
    // Encapsulation
    var valueInch: Double {
        return self.inchValue
    }
    
    
    // Conversions
    func toMetre() -> Metre {
        return Metre(metres: inchValue / Constants.MetreToInch)
    }
    
    func toMile() -> Mile {
        return Mile(miles: inchValue / Constants.MileToInch)
    }
    
    func toYard() -> Yard {
        return Yard(yards: inchValue / Constants.YardToInch)
    }
    
}
