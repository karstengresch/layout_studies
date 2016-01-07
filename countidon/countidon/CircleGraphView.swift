//
//  CircleGraphView.swift
//  CounterAnimations
//
//  Created by Karsten Gresch on 05.10.15.
//  Derived w/ full Copyright attribution from: 
//  http://makeapppie.com/2015/03/10/swift-swift-basic-core-graphics-for-the-ring-graph/

import UIKit



@IBDesignable
class CircleGraphView: UIControl {

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
  @IBInspectable var minutes: NSString = "Whereof we cannot speak, thereof we must remain silent."
  
  
  @IBInspectable var labelFontColor: UIColor { return UIColor.whiteColor() }
  @IBInspectable var labelFont: UIFont? = UIFont(name: "Helvetica Neue", size: 12)
  @IBInspectable var labelFontParagraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
  @IBInspectable var labelFontObliqueness = 0.1
  
 
  var lastInterval = NSTimeInterval()
  var timer = NSTimer()
  var totalTime = NSTimeInterval()
  let maxTime: Double = 12.0
  var isRunning = false
  var wasStopped = false
  var counterTimeValues = (minutes: "00", seconds: "00", milliseconds: "00")


  
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
      
      
      let labelFontAttributes: NSDictionary = [ NSForegroundColorAttributeName: labelFontColor,
        NSParagraphStyleAttributeName: labelFontParagraphStyle,
        NSObliquenessAttributeName: labelFontObliqueness,
        NSFontAttributeName: labelFont!
      ]
      
      let delimiter = "\t:\t"
      let timeLabel: NSString = counterTimeValues.minutes + delimiter + counterTimeValues.seconds + delimiter + counterTimeValues.milliseconds
      let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
      let size = timeLabel.sizeWithAttributes((labelFontAttributes as! [String : AnyObject]))

      timeLabel.drawInRect(CGRectMake(center.x,center.y,size.width,size.height), withAttributes: (labelFontAttributes as! [String : AnyObject]))
    
      
      
    }
 /*
  override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
    print("Circle Graph View: Touches ended")
    buttonPressed(self)
  }
  */
  @IBAction func buttonPressed(sender: AnyObject) {
    print("Circle Graph View: Button pressed")
    printStatus()
    
    if ( !isRunning )
    {
      print("Circle Graph View: was NOT running")
      printStatus()
      if !wasStopped {
       endArc = 0
      } else {
       lastInterval = NSDate.timeIntervalSinceReferenceDate()
      }
      
      if !timer.valid {
        print("Circle Graph View: Timer was NOT valid and was NOT running")
        printStatus()
        // let selector: Selector = "updateCounter"
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01,
          target: self,
          selector: "updateCounter",
          userInfo: nil,
          repeats: true)
          lastInterval = NSDate.timeIntervalSinceReferenceDate()
      } else {
        print("Circle Graph View: Timer >>was<< valid and was NOT running")
        printStatus()
        timer.invalidate()
        let timeGone = totalTime / maxTime
        endArc = CGFloat(timeGone)
        wasStopped = true
      }
    } else { // IS running
      print("Circle Graph View: >>was<< running")

      if !timer.valid {
        print("Circle Graph View: Timer was NOT valid and >>was<< running")
        printStatus()
        // let selector: Selector = "updateCounter"
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01,
          target: self,
          selector: "updateCounter",
          userInfo: nil,
          repeats: true)
        lastInterval = NSDate.timeIntervalSinceReferenceDate()
      } else {
        print("Circle Graph View: Timer >>was<< valid and >>was<< running")
        printStatus()
        timer.invalidate()
        let timeGone = totalTime / maxTime
        endArc = CGFloat(timeGone)
        wasStopped = true
      }
    }
    
    isRunning = isRunning ? false : true
  }
  
  
  func printStatus() {
    print("***Status***\n\tendArc: \(endArc) - totalTime: \(totalTime) - lastInterval: \(lastInterval)")
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
      
      counterTimeValues = getCounterTimeValues()
      // timeLabel?.text = "\(counterTimeValues.minutes):\(counterTimeValues.seconds):\(counterTimeValues.milliseconds)"
      
    }
    else {
      endArc = 1.0
      // percentLabel?.text = "100%"
      // timeLabel?.text = String(format: "%2.2f", maxTime)
      counterTimeValues = getCounterTimeValues()
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
