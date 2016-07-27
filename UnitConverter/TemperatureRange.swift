//
//  TemperatureRange.swift
//  UnitConverter
//
//  Created by Bobby Solberg on 7/26/16.
//  Copyright © 2016 Bobby Solberg. All rights reserved.
//

import UIKit

class TemperatureRange: NSObject, UIPickerViewDataSource {
    
    let values = (-100...100).map { $0 }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }

}