//
//  Kilograms.swift
//  UnitConverterApp
//
//  Created by Rammuni Ravidu Suien Silva on 2021-02-13.
//


// Contains the Structures for the Weight Units
import Foundation


// Structure for Kilograms
struct Kilograms {
        
    private var kilogramsValue: Double = 0.0
    private var gramsValue: Double = 0.0

    init(kilograms val_kg: Double) {
        self.kilogramsValue = val_kg
        self.gramsValue = self.toGrams(kilogram: val_kg)
    }
    
    // Encapsulation
    var valueKilograms: Double {
        return self.kilogramsValue
    }
    
    var valueGrams: Double {
        return self.gramsValue
    }
    
    
    // Conversions
    init(grams val_g: Double) {
        self.kilogramsValue = self.toKilograms(grams: val_g)
        self.gramsValue = val_g
    }
    
    func toPounds() -> Pounds{
        return Pounds(pounds: (kilogramsValue * Constants.KgToLbs))
    }
    
    
    
    // Private Functions
    private func toGrams(kilogram val_kg: Double)->Double {
        let gramsValue = val_kg * 1000.0
        return gramsValue
    }
    
    private func toKilograms(grams val_g: Double)->Double {
        let kilogramsValue = val_g / 1000.0
        return kilogramsValue
    }
    
}


// Structure for Pounds
struct Pounds {
    private var poundsValue: Double = 0.0
    private var stPoundsValue_st: Int = 0
    private var stPoundsValue_lbs: Int = 0
    
    init(pounds val_p: Double) {
        self.poundsValue = val_p
        self.stPoundsValue_st = toStPounds_st(pounds: val_p)
        self.stPoundsValue_lbs = toStPounds_lbs(pounds: val_p)
    }
    
    init(pounds_st val_st:Int, pounds_lbs val_lbs:Int) {
        self.poundsValue = toPounds(pounds_st: val_st, pounds_lbs: val_lbs)
        self.stPoundsValue_st = val_st
        self.stPoundsValue_lbs = val_lbs
    }
    
    // Encapsulation
    var valuePounds: Double {
        return self.poundsValue
    }
    
    var valueStPounds_st: Int {
        return self.stPoundsValue_st
    }
    
    var valueStPounds_lbs: Int {
        return self.stPoundsValue_lbs
    }
    
    
    // Conversions
    func toKilograms() -> Kilograms {
        return Kilograms( kilograms: (poundsValue * (1/Constants.KgToLbs)) )
    }
    
    
    
    // Private Functions
    private func toStPounds_st(pounds val_p: Double)->Int{
        let stPoundsValue_st = Int(round(val_p)) / Constants.PoundsPerStone
        return stPoundsValue_st
    }
    
    private func toStPounds_lbs(pounds val_p: Double)->Int{
        let stPoundsValue_lbs = Int(round(val_p)) % Constants.PoundsPerStone
        return stPoundsValue_lbs
    }
    
    private func toPounds(pounds_st val_st:Int, pounds_lbs val_lbs:Int)->Double{
        let poundsValue = (val_st * Constants.PoundsPerStone) + val_lbs
        return Double(poundsValue)
    }
    
}
