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
    var hour:Int = 0
    var minute:Int = 0
  
  
  let pickerData = [
    Array(0...99),
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
      
      /*let height = CGFloat(20)
       let offsetX = self.frame.size.width / 3
       let offsetY = self.frame.size.height/2 - height/2
       let marginX = CGFloat(42)
       let width = offsetX - marginX
       
       let hourLabel = UILabel(frame: CGRectMake(marginX, offsetY, width, height))
       hourLabel.text = "hour"
       self.addSubview(hourLabel)
       
       let minsLabel = UILabel(frame: CGRectMake(marginX + offsetX, offsetY, width, height))
       minsLabel.text = "min"
       self.addSubview(minsLabel)*/
    }
    
    func getDate() -> NSDate{
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "HH:mm"
      let date = dateFormatter.date(from: String(format: "%02d", self.hour) + ":" + String(format: "%02d", self.minute))
      return date! as NSDate
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      switch component {
      case 0:
        self.hour = row
      case 1:
        self.minute = row
      default:
        print("No component with number \(component)")
      }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      
      return pickerData[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
      return 30
    }
    
  // looks dangerous now
  func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
      if (view != nil) {
        (view as! UILabel).text = String(format:"%02lu", row)
        return view!
      }
      let columnView = UILabel(frame: CGRect(x: 35, y: 0, width: self.frame.size.width/3 - 35, height: 30))
      columnView.text = String(format:"%02lu", row)
      columnView.textAlignment = NSTextAlignment.center
      
      return columnView
    }
    
}
