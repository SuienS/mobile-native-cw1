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
    var valueMPS: Double {
        return self.mpsValue
    }
    
    
    // Conversions
    func toKMPH() -> KMPH {
        return KMPH(kmph: mpsValue * Constants.MpsToKmph)
    }
    
    func toMPH() -> MPH {
        return MPH(mph: mpsValue * Constants.MpsToMph)
    }
    
    func toKnot() -> Knot {
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
    
    func toMPH() -> MPH {
        return MPH(mph: kmphValue * Constants.KmphToMph)
    }
    
    func toKnot() -> Knot {
        return Knot(knots: kmphValue * Constants.KmphToKnots)
    }
    
    
}

struct MPH {
    
    private var mphValue: Double = 0.0
    
    init(mph val_mph: Double) {
        self.mphValue = val_mph
    }
    
    // Encapsulation
    var valueMPH: Double {
        return self.mphValue
    }
    
    // Conversions
    func toKMPH() -> KMPH {
        return KMPH(kmph: mphValue / Constants.KmphToMph)
    }
    
    func toMPS() -> MPS {
        return MPS(mps: mphValue / Constants.MpsToMph)
    }
    
    func toKnot() -> Knot {
        return Knot(knots: mphValue * Constants.MphToKnots)
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
    
    func toMPH() -> MPH {
        return MPH(mph: knotsValue / Constants.MphToKnots)
    }
}
