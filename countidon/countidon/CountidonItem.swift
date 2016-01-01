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
  
  var lastInterval = NSTimeInterval()
  var timer = NSTimer()
  var totalTime = NSTimeInterval()
  let maxTime: Double = 12.0

  
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
  
  // MARK: Counting Related Algorithms
  func getCounterTimeValues() -> (minutes: String, seconds: String, milliseconds: String) {
    
    let now = NSDate.timeIntervalSinceReferenceDate()
    // 10-8 = 2
    totalTime += now - lastInterval
    // 12-10 = 2
    lastInterval = now
    
    var counterTime = totalTime
    let minutes = Int(counterTime / 60)
    
    counterTime -= (NSTimeInterval(minutes) * 60)
    let minutesValue = String(format: "%02d", minutes)
    
    let seconds = Int(counterTime)
    counterTime -= (NSTimeInterval(seconds))
    let secondsValue = String(format: "%02d", seconds)
    
    let milliseconds = Int(counterTime * 100)
    let millisecondsValue = String(format: "%02d", milliseconds)
    
    return (minutesValue, secondsValue, millisecondsValue)
  }
  
  

}
