//
//  Constants.swift
//  UnitConverterApp
//
//  Created by Rammuni Ravidu Suien Silva on 2021-02-13.
//

// Contains all the necessary Constant values for the calculations
import Foundation

// Enums representing Units
enum Units {
    case Grams
    case Kilograms
    case Pounds
    case Stone_Pounds_St
    case Stone_Pounds_Lbs
    case Celsius
    case Fahrenheit
    case Kelvin
    case Metre
    case Kilometre
    case Mile
    case Centimetre
    case Millimetre
    case Yard
    case Inch
    case MPS
    case KMPH
    case MPH
    case Knot
    case GallonUK
    case Litre
    case PintUK
    case FluidOunce
    case Millilitre
}

// Constants Struct
// Source: https://www.unitconverters.net
struct Constants {
       
    // Weight
    static let KgToLbs: Double = 2.2046226218
    
    // Temperature
    static let PoundsPerStone: Int = 14
    
    static let CelsiusToKelvin: Double = 273.15
    
    static let CelsiusToFahrenheit_mul: Double = 1.8 // (9.0/5.0)
    
    static let CelsiusToFahrenheit_add: Double = 32.0
    
    // Length
    static let MetreToMile: Double = 0.0006213712
    
    static let MetreToYard: Double = 1.0936132983
    
    static let MetreToInch: Double = 39.3700787402
    
    static let MileToYard: Double = 1760
    
    static let MileToInch: Double = 63360
    
    static let YardToInch: Double = 36
    
    // Speed
    static let MpsToKmph: Double = 3.6
    
    static let MpsToKnot: Double = 1.9438444924
    
    static let KmphToMph: Double = 0.6213711922
    
    static let KmphToKnots: Double = 0.5396118248
    
    static let MphToKnots: Double = 0.8684210526
    
    static let MpsToMph: Double = 2.2369362921
    
    // Liquid
    static let UkGToLitre: Double = 4.54609
    
    static let UkGToPint: Double = 8.0
    
    static let UkGToFluidOnce: Double = 160.0 //UK Fuild Ounce
    
    static let LitreToPint: Double = 1.7597539864
    
    static let LitreToFluidOunce: Double = 35.195079728
    
    static let PintToGallonUK: Double = 0.125
    
    static let PintToFluidOunce: Double = 20.0
}

