//
//  Constants.swift
//  UnitConverterApp
//
//  Created by Rammuni Ravidu Suien Silva on 2021-02-13.
//

import Foundation

struct Constants {
       
    // Weight
    // Source: https://www.unitconverters.net/weight-and-mass/kg-to-lbs.htm
    static let KgToLbs: Double = 2.2046226218
    
    // Temperature
    static let PoundsPerStone: Int = 14
    
    static let CelsiusToKelvin: Double = 273.15
    
    static let CelsiusToFahrenheit_mul: Double = 1.8 // 9.0/5.0
    static let CelsiusToFahrenheit_add: Double = 32.0
    
    // Length
    static let MetreToMile: Double = 0.0006213712
    
    static let MetreToYard: Double = 1.0936132983
    
    static let MetreToInch: Double = 39.3700787402
    
    static let MileToYard: Double = 1760
    
    static let MileToInch: Double = 63360
    
    static let YardToInch: Double = 32
    
    // Speed
    static let MpsToKmph: Double = 3.6
    
    static let MpsToKnot: Double = 1.9438444924
    
    static let KmphToMips: Double = 0.0001726031
    
    static let KmphToKnots: Double = 0.5396118248
    
    static let MipsToKnots: Double = 3126.3157895
    
    // Liquid
    static let UkGToLitre: Double = 4.54609
    
    static let UkGToPint: Double = 8.0
    
    static let UkGToFluidOnce: Double = 160.0 //UK Fuild Ounce
    
    static let LitreToPint: Double = 1.7597539864
    
    static let LitreToFluidOunce: Double = 35.195079728
    
    static let PintToGallonUK: Double = 0.125
    
    static let PintToFluidOunce: Double = 20.0
}

