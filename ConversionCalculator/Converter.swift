//
//  Converter.swift
//  ConversionCalculator
//
//  Created by Hayden Haddock on 11/11/17.
//  Copyright © 2017 Tech Innovator. All rights reserved.
//

import Foundation

struct Converter {
    let label: String
    let inputUnit: String
    let outputUnit: String
    
    init(label:String, inputUnit:String, outputUnit:String) {
        self.label = label
        self.inputUnit = inputUnit
        self.outputUnit = outputUnit
    }
}
