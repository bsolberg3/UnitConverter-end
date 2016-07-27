//
//  UnitConverter.swift
//  UnitConverter
//
//  Created by Bobby Solberg on 7/26/16.
//  Copyright © 2016 Bobby Solberg. All rights reserved.
//

import Foundation

class UnitConverter {
    
    func degreesFahrenheit(degreesCelsius: Int) -> Int {
        return Int(1.8 * Float(degreesCelsius) + 32.0)
    }
    
    func pounds(kilogram: Int) -> Int {
        return Int(Float(kilogram) / 2)
    }
}