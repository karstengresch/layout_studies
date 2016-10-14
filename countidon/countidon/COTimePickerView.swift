//
//  COTimePickerView.swift
//  countidon
//
//  Created by Karsten Gresch on 13.10.16.
//  Derived from StackOverflow http://stackoverflow.com/questions/10999575/uipickerview-that-looks-like-uidatepicker-but-with-seconds ...
//  ... from the kind fella Mikael, http://stackoverflow.com/users/2015572/mikael
//  Copyright © 2016 Closure One. All rights reserved.
//

import UIKit

class COTimePickerView: UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate {

    // Only allowing hours so far.
    var hour: Int = 0
    var minute: Int = 0
    var second: Int = 0
  
  
  let hours: Int = 0
  let minutes: Int = 1
  let seconds: Int = 2
  
  
  
  let pickerData = [
    Array(0...99),
    Array(0...59),
    Array(0...59)
    ]
  
    required internal init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      self.setup()
    }
  
    override init(frame: CGRect) {
      super.init(frame: frame)
      self.setup()
    }
    
    func setup(){
      self.delegate = self
      self.dataSource = self
      // self.selectRow(1, inComponent: seconds, animated: false)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      switch component {
      case 0:
        self.hour = row
      case 1:
        self.minute = row
      case 2:
        self.second = row
        
      default:
        print("No component with number \(component)")
      }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      return pickerData[component].count
    }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return pickerData[component][row]
  }

  
}
