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
  
  required init?(coder aDecoder: NSCoder) {
    created = aDecoder.decodeObjectForKey("CountidonItemCreated") as! NSDate
    name = aDecoder.decodeObjectForKey("CountidonItemName") as! String
    timeToCountdown = aDecoder.decodeIntegerForKey("CountidonItemTimeToCountdown")
    super.init()
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(created, forKey: "CountidonItemCreated")
    aCoder.encodeObject(name, forKey: "CountidonItemName")
    aCoder.encodeObject(timeToCountdown, forKey: "CountidonItemTimeToCountdown")
  }
  
  init(name: String) {
    self.created = NSDate()
    self.name = name
    super.init()
  }

}
