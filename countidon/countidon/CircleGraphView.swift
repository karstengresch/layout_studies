//
//  CircleGraphView.swift
//  CounterAnimations
//
//  Created by Karsten Gresch on 05.10.15.
//  Derived w/ full Copyright attribution from: 
//  http://makeapppie.com/2015/03/10/swift-swift-basic-core-graphics-for-the-ring-graph/

import UIKit



@IBDesignable
class CircleGraphView: UIView {

  @IBInspectable var endArc: CGFloat = 0.5 { // up to 1.0
    didSet {
      // print("End arc set. Value: \(endArc)")
      setNeedsDisplay()
    }
  }
  // TODO should be based on the surrounding bounds
  @IBInspectable var arcWidth: CGFloat =  10.0
  @IBInspectable var arcColor: UIColor = UIColor(hue:0.113, saturation:0.9598, brightness:0.9717, alpha:1.0)
  @IBInspectable var arcBackgroundColor: UIColor = UIColor(hue:0.4167, saturation:0.036, brightness:0.2124, alpha:1.0)
  
  
  
  var lastInterval = NSTimeInterval()
  var timer = NSTimer()
  var totalTime = NSTimeInterval()
  let maxTime: Double = 12.0
  var isRunning = false
  var wasStopped = false


  
    override func drawRect(rect: CGRect) {

      // circle defs
      let fullCircle = 2.0 * π
      let start: CGFloat = -0.25 * fullCircle
      let end: CGFloat = endArc * fullCircle + start
      // "We need a center point, an angle on the circle to start and an angle on the circle to end."
      let centerPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
      var radius: CGFloat = 0.0
      
      if CGRectGetWidth(rect) > CGRectGetHeight(rect) {
        radius = (CGRectGetWidth(rect) - arcWidth) / 2.0
      } else {
        radius = (CGRectGetHeight(rect) - arcWidth) / 2.0
      }
      
      let context = UIGraphicsGetCurrentContext()
      // let colorspace = CGColorSpaceCreateDeviceRGB()
      CGContextSetLineWidth(context, arcWidth)
      CGContextSetLineCap(context, .Round)
      CGContextSetStrokeColorWithColor(context, arcColor.CGColor)
      
      CGContextAddArc(context, centerPoint.x, centerPoint.y, radius, start, end, 0)
      CGContextStrokePath(context)

      
    }
  
  override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
      print("Circle Graph View: Touches ended")
    buttonPressed(self)

  }
  
  @IBAction func buttonPressed(sender: AnyObject) {
    print("Circle Graph View: Button pressed")
    
    
    if ( !isRunning )
    {
      print("Circle Graph View: was NOT running")
      if !wasStopped {
       endArc = 0
      } else {
       lastInterval = NSDate.timeIntervalSinceReferenceDate()
      }
      
      if !timer.valid {
        print("Circle Graph View: Timer was NOT valid and was NOT running")
        let selector: Selector = "updateCounter"
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01,
          target: self,
          selector: selector,
          userInfo: nil,
          repeats: true)
          lastInterval = NSDate.timeIntervalSinceReferenceDate()
      } else {
        print("Circle Graph View: Timer >>was<< valid and was NOT running")
        timer.invalidate()
        let timeGone = totalTime / maxTime
        endArc = CGFloat(timeGone)
        wasStopped = true
      }
    } else {
      print("Circle Graph View: >>was<< running")
      if !timer.valid {
        print("Circle Graph View: Timer was NOT valid and >>was<< running")
        let selector: Selector = "updateCounter"
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01,
          target: self,
          selector: selector,
          userInfo: nil,
          repeats: true)
        lastInterval = NSDate.timeIntervalSinceReferenceDate()
      } else {
        print("Circle Graph View: Timer >>was<< valid and >>was<< running")
        timer.invalidate()
        let timeGone = totalTime / maxTime
        endArc = CGFloat(timeGone)
        wasStopped = true
      }
    }
    
    isRunning = isRunning ? false : true
  }
  
  // TODO: Check reference day as parameter!
  func updateCounter() {
    
    let now = NSDate.timeIntervalSinceReferenceDate()
    totalTime += now - lastInterval
    lastInterval = now
    
    if(totalTime < maxTime) {
      let timeGone = totalTime / maxTime
      endArc = CGFloat(timeGone)
      // percentLabel?.text = String(format: " %5.2f %%", timeGone * 100)
      // print("\(timeGone)")
      
      // let counterTimeValues = getCounterTimeValues()
      // timeLabel?.text = "\(counterTimeValues.minutes):\(counterTimeValues.seconds):\(counterTimeValues.milliseconds)"
      
    }
    else {
      endArc = 1.0
      // percentLabel?.text = "100%"
      // timeLabel?.text = String(format: "%2.2f", maxTime)
      // let counterTimeValues = getCounterTimeValues()
      // timeLabel?.text = "\(counterTimeValues.minutes):\(counterTimeValues.seconds):00"
      totalTime = 0
      timer.invalidate()
    }
    
  }
  
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
