//
//  SecondViewController.swift
//  UnitConverter
//
//  Created by Bobby Solberg on 7/26/16.
//  Copyright © 2016 Bobby Solberg. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate {
    
    let userDefaultsLastRowKey = "defaultKilogramPickerRow"
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var kilogramPicker: UIPickerView!
    @IBOutlet var weightRange: WeightRange!
    
    
    private let converter = UnitConverter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let row = initialPickerRow()
        kilogramPicker.selectRow(row, inComponent: 0, animated: false)
        pickerView(kilogramPicker, didSelectRow: row, inComponent: 0)
    }
    
    func initialPickerRow() -> Int {
        let savedRow = NSUserDefaults.standardUserDefaults().objectForKey(userDefaultsLastRowKey) as? Int
        if let row = savedRow  {
            return row
        } else {
            return kilogramPicker.numberOfRowsInComponent(0) / 2
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print("This is running")
        let kilogramValue = weightRange.values[row]
        return "\(kilogramValue)kg"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        displayConvertedWeightForRow(row)
        saveSelectedRow(row)
    }
    
    func displayConvertedWeightForRow(row: Int) {
        let kilogram = weightRange.values[row]
        weightLabel.text = "\(converter.pounds(kilogram))lbs"
    }
    
    func saveSelectedRow(row: Int) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(row, forKey: userDefaultsLastRowKey)
        defaults.synchronize()
    }
    
}