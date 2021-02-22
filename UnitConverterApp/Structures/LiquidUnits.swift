//
//  LiquidUnits.swift
//  UnitConverterApp
//
//  Created by Rammuni Ravidu Suien Silva on 2021-02-20.
//

// Contains the structures for the Liquid units
import Foundation

//  Structure for Gallon (UK)
struct GallonUK {
    
    private var gallonukValue: Double = 0.0
    
    init(gallonUK cal_g: Double) {
        self.gallonukValue = cal_g
    }
    
    // Encapsulation
    var valueGallonUK: Double {
        return self.gallonukValue
    }
    
    // Conversions
    func toLitre() -> Litre {
        return Litre(litre: gallonukValue * Constants.UkGToLitre)
    }
    
    func toPintUK() -> PintUK {
        return PintUK(pintUK: gallonukValue * Constants.UkGToPint)
    }
    
    func toFluidOunce() -> FluidOunce {
        return FluidOunce(fluidOunce: gallonukValue * Constants.UkGToFluidOnce)
    }
    
}


// Structure for Litre
struct Litre {
    private var litreValue: Double = 0.0
    private var millilitreValue: Double = 0.0
    
    init(litre val_l: Double) {
        self.litreValue = val_l
        self.millilitreValue = val_l * 1000.0
    }
    
    init(millilitre val_ml: Double) {
        self.litreValue = val_ml / 1000.0
        self.millilitreValue = val_ml
    }
    
    // Encapsulation
    var valueLitre: Double {
        return self.litreValue
    }
    
    var valueMillilitre: Double {
        return self.millilitreValue
    }
    
    
    // Convertions
    func toGallonUK() -> GallonUK {
        return GallonUK(gallonUK: litreValue / Constants.UkGToLitre)
    }
    
    func toPintUK() -> PintUK {
        return PintUK(pintUK: valueLitre * Constants.LitreToPint)
    }
    
    func toFluidOunce() -> FluidOunce {
        return FluidOunce(fluidOunce: valueLitre * Constants.LitreToFluidOunce)
    }
    
}

// Structure for Pint (UK)
struct PintUK {
    private var pintukValue: Double = 0.0
    
    init(pintUK val_p: Double) {
        self.pintukValue = val_p
    }
    
    // Encapsulation
    var valuePintUK: Double {
        return self.pintukValue
    }
    
    
    // Conversions
    func toGallonUK() -> GallonUK {
        return GallonUK(gallonUK: pintukValue * Constants.PintToGallonUK)
    }
    
    func toLitre() -> Litre {
        return Litre(litre: pintukValue / Constants.LitreToPint)
    }
    
    func toFluidOunce() -> FluidOunce {
        return FluidOunce(fluidOunce: pintukValue * Constants.PintToFluidOunce)
    }
    
    
}


// Structure for Fluid Ounce
struct FluidOunce {
    private var fluidonceValue: Double = 0.0
    
    init(fluidOunce val_fl: Double) {
        self.fluidonceValue = val_fl
    }
    
    // Encapsulation
    var valueFluidOunce: Double {
        return self.fluidonceValue
    }
    
    
    // Conversions
    func toGallonUK() -> GallonUK {
        return GallonUK(gallonUK: fluidonceValue / Constants.UkGToFluidOnce)
    }
    
    func toLitre() -> Litre {
        return Litre(litre: fluidonceValue / Constants.LitreToFluidOunce)
    }
    
    func toPint() -> PintUK {
        return PintUK(pintUK: fluidonceValue / Constants.PintToFluidOunce)
    }
}
