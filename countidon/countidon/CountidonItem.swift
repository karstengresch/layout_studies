//
//  CountidonItem.swift
//  countidon
//
//  Created by Karsten Gresch on 26.12.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit
import Foundation

/**
 The individual counter item.
*/
class CountidonItem: NSObject, NSCoding {
  let created: NSDate
  var name = ""
  var timeToCountdown: NSInteger = 0
  var circleForegroundColor = UIColor(hue:1, saturation:1, brightness:0, alpha:1)
  var circleBackgroundColor = UIColor(hue:0, saturation:0, brightness:1, alpha:1)
  var circleViewBackgroundColor = UIColor.clearColor()
  
  required init?(coder aDecoder: NSCoder) {
    created = aDecoder.decodeObjectForKey("CountidonItemCreated") as! NSDate
    name = aDecoder.decodeObjectForKey("CountidonItemName") as! String
    timeToCountdown = aDecoder.decodeIntegerForKey("CountidonItemTimeToCountdown")
    circleViewBackgroundColor = aDecoder.decodeObjectForKey("CircleViewBackgroundColor") as! UIColor
    
    super.init()
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(created, forKey: "CountidonItemCreated")
    aCoder.encodeObject(name, forKey: "CountidonItemName")
    aCoder.encodeObject(timeToCountdown, forKey: "CountidonItemTimeToCountdown")
    aCoder.encodeObject(circleViewBackgroundColor, forKey: "CircleViewBackgroundColor")
  }
  
  init(name: String) {
    self.created = NSDate()
    self.name = name
    super.init()
  }

}
