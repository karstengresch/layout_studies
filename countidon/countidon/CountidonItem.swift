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
  var created = NSDate()
  var name = ""
  /**
      Time to countdown in seconds
   */
  var timeToCountdown: NSInteger = 0
  var circleForegroundColor = UIColor(hue:1, saturation:1, brightness:0, alpha:1)
  var circleBackgroundColor = UIColor(hue:0, saturation:0, brightness:1, alpha:1)
  var circleViewBackgroundColor = UIColor.clear
  
  var lastInterval = TimeInterval()
  var timer = Timer()
  var totalTime = TimeInterval()
  let maxTime: Double = 12.0

  
  override init() {
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    print("init?")
    created = aDecoder.decodeObject(forKey: COUNTIDON_ITEM_CREATED) as! NSDate
    name = aDecoder.decodeObject(forKey: COUNTIDON_ITEM_NAME) as! String
    timeToCountdown = aDecoder.decodeInteger(forKey: COUNTIDON_ITEM_TIME_TO_COUNTDOWN)
    circleViewBackgroundColor = aDecoder.decodeObject(forKey: COUNTIDON_ITEM_CIRCLE_VIEW_BACKGROUND_COLOR) as! UIColor
    
    super.init()
  }
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(created, forKey: COUNTIDON_ITEM_CREATED)
    aCoder.encode(name, forKey: COUNTIDON_ITEM_NAME)
    aCoder.encode(timeToCountdown, forKey: COUNTIDON_ITEM_TIME_TO_COUNTDOWN)
    aCoder.encode(circleViewBackgroundColor, forKey: COUNTIDON_ITEM_CIRCLE_VIEW_BACKGROUND_COLOR)
  }
  
  init(name: String) {
    // self.created = NSDate()
    self.name = name
    super.init()
  }

}
