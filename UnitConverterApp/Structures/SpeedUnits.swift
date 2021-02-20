//
//  SpeedUnits.swift
//  UnitConverterApp
//
//  Created by Rammuni Ravidu Suien Silva on 2021-02-19.
//

import Foundation

struct MPS {
    
    private var mpsValue: Double = 0.0
    
    init(mps val_mps: Double) {
        self.mpsValue = val_mps
    }
    
    // Encapulation
    var valueMPE: Double {
        return self.mpsValue
    }
    
    
    // Conversions
    func toKMPH() -> KMPH {
        return KMPH(kmph: mpsValue * Constants.MpsToKmph)
    }
    
    func toMiPS() -> MiPS {
        return MiPS(mips: mpsValue * Constants.MetreToMile)
    }
    
    func toKnots() -> Knot {
        return Knot(knots: mpsValue * Constants.MpsToKnot)
    }
    
}

struct KMPH {
    
    private var kmphValue: Double = 0.0
    
    init(kmph val_kmph: Double) {
        self.kmphValue = val_kmph
    }
    
    // Encapsulation
    var valueKMPH: Double {
        return self.kmphValue
    }
    
    // Conversions
    func toMPS() -> MPS {
        return MPS(mps: kmphValue / Constants.MpsToKmph)
    }
    
    func toMiPS() -> MiPS {
        return MiPS(mips: kmphValue * Constants.KmphToMips)
    }
    
    func toKnot() -> Knot {
        return Knot(knots: kmphValue * Constants.KmphToMips)
    }
    
    
}

struct MiPS {
    
    private var mipsValue: Double = 0.0
    
    init(mips val_mips: Double) {
        self.mipsValue = val_mips
    }
    
    // Encapsulation
    var valueMiPS: Double {
        return self.mipsValue
    }
    
    // Conversions
    func toKMPH() -> KMPH {
        return KMPH(kmph: mipsValue / Constants.KmphToMips)
    }
    
    func toMPS() -> MPS {
        return MPS(mps: mipsValue / Constants.MetreToMile)
    }
    
    func toKnots() -> Knot {
        return Knot(knots: mipsValue * Constants.MipsToKnots)
    }
    
    
    
}

struct Knot {
    private var knotsValue: Double = 0.0
    
    init(knots val_knots: Double) {
        self.knotsValue = val_knots
    }
    
    // Encapsulation
    var valueKnot: Double {
        return self.knotsValue
    }
    
    // Conversions
    func toKMPH() -> KMPH {
        return KMPH(kmph: knotsValue / Constants.KmphToKnots)
    }
    
    func toMPS() -> MPS {
        return MPS(mps: knotsValue / Constants.MpsToKnot)
    }
    
    func toMiPS() -> MiPS {
        return MiPS(mips: knotsValue / Constants.MipsToKnots)
    }
}
