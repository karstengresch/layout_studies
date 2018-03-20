//
//  CircleGraphView.swift
//  CounterAnimations
//
//  Created by Karsten Gresch on 05.10.15.
//  Derived w/ full Copyright attribution from: 
//  http://makeapppie.com/2015/03/10/swift-swift-basic-core-graphics-for-the-ring-graph/

import UIKit

protocol CircleGraphViewDelegate: class {
  func set(maxTime xMaxTime: Double)
  func setArcColor(_ color: UIColor)
}

@IBDesignable
class CircleGraphView: UIControl {

  @IBInspectable var endArc: CGFloat = 0.5 { // up to 1.0
    didSet {
      // print("End arc set. Value: \(endArc)")
      setNeedsDisplay()
    }
  }
  // TODO should be based on the surrounding bounds
  // TODO from external in setup
  @IBInspectable var arcWidth: CGFloat =  10.0
  @IBInspectable var arcColor: UIColor = UIColor(hue:0.113, saturation:0.9598, brightness:0.9717, alpha:1.0)
  @IBInspectable var arcBackgroundColor: UIColor = UIColor(hue:0.4167, saturation:0.036, brightness:0.2124, alpha:1.0)
  @IBInspectable var minutes: NSString = "Whereof we cannot speak, thereof we must remain silent."
  
  // Labels
  @IBInspectable var labelFontColor: UIColor { return UIColor.white }
  @IBInspectable var labelFont: UIFont? = UIFont(name: "Avenir Next", size: 18)
  @IBInspectable var labelFontParagraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
  @IBInspectable var labelFontObliqueness = 0.1
  
 
  var lastInterval = TimeInterval()
  var timer = Timer()
  var totalTime = TimeInterval()
  let maxTime: Double = 12.0
  var isRunning = false
  var wasStopped = false
  var counterTimeValues = (minutes: "00", seconds: "00", milliseconds: "00")


  
    override func draw(_ rect: CGRect) {
      // print("arcWidth: \(arcWidth)")
      // circle defs
      let fullCircle = 2.0 * π
      let start: CGFloat = -0.25 * fullCircle
      let end: CGFloat = endArc * fullCircle + start
      // "We need a center point, an angle on the circle to start and an angle on the circle to end."
      let centerPoint = CGPoint(x: rect.midX, y: rect.midY)
      var radius: CGFloat = 0.0
      
      if rect.width > rect.height {
        radius = (rect.width - arcWidth) / 2.0
      } else {
        radius = (rect.height - arcWidth) / 2.0
      }
      
      let context = UIGraphicsGetCurrentContext()
      // let colorspace = CGColorSpaceCreateDeviceRGB()
      context!.setLineWidth(arcWidth)
      context!.setLineCap(.round)
      context!.setStrokeColor(arcColor.cgColor)
      
      // CGContextAddArc(context, centerPoint.x, centerPoint.y, radius, start, end, 0)
      context?.addArc(center: centerPoint, radius: radius, startAngle: start, endAngle: end, clockwise: true)
      context!.strokePath()
      
      let labelFontAttributes: NSDictionary = [ NSAttributedStringKey.foregroundColor: labelFontColor,
        NSAttributedStringKey.paragraphStyle: labelFontParagraphStyle,
        NSAttributedStringKey.obliqueness: labelFontObliqueness,
        NSAttributedStringKey.font: labelFont!
      ]
      
      let delimiter = "\t:\t"
      let timeLabel: NSString = counterTimeValues.minutes + delimiter + counterTimeValues.seconds + delimiter + counterTimeValues.milliseconds as NSString
      let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
      // let size = timeLabel.size(withAttributes: (labelFontAttributes as! [String : AnyObject]))
      let size = timeLabel.size(withAttributes: (labelFontAttributes as! [NSAttributedStringKey : Any]))
      timeLabel.draw(in: CGRect(x: center.x - size.width/2, y: center.y - size.height/2, width: size.width*1.2,height: size.height*1.2), withAttributes: (labelFontAttributes as! [NSAttributedStringKey : Any]))
      
      let dummyLabel = UILabel()
      dummyLabel.text = "Harr harr, Dingo"
      dummyLabel.font = UIFont.systemFont(ofSize: 22)
      
      
      self.inputView?.addSubview(dummyLabel)
      
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
       lastInterval = NSDate.timeIntervalSinceReferenceDate
      }
      
      if !timer.isValid {
        print("Circle Graph View: Timer was NOT valid and was NOT running")
        printStatus()
        // let selector: Selector = "updateCounter"
        timer = Timer.scheduledTimer(timeInterval: 0.01,
          target: self,
          selector: #selector(CircleGraphView.updateCounter),
          userInfo: nil,
          repeats: true)
          lastInterval = NSDate.timeIntervalSinceReferenceDate
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

      if !timer.isValid {
        print("Circle Graph View: Timer was NOT valid and >>was<< running")
        printStatus()
        // let selector: Selector = "updateCounter"
        timer = Timer.scheduledTimer(timeInterval: 0.01,
          target: self,
          selector: #selector(CircleGraphView.updateCounter),
          userInfo: nil,
          repeats: true)
        lastInterval = NSDate.timeIntervalSinceReferenceDate
      } else {
        print("Circle Graph View: Timer >>was<< valid and >>was<< running")
        printStatus()
        timer.invalidate()
        
        endArc = CGFloat(maxTime)
        wasStopped = true
      }
    }
    
    isRunning = isRunning ? false : true
  }
  
  
  func printStatus() {
    print("***Status***\n\tendArc: \(endArc) - totalTime: \(totalTime) - lastInterval: \(lastInterval)")
  }
  
  // TODO: Check reference day as parameter!
  @objc func updateCounter() {
    
    let now = NSDate.timeIntervalSinceReferenceDate
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
    
    let timeGone = totalTime / maxTime
    if (totalTime > maxTime) {
      print("timeGone: \(timeGone)")
    }

    
  }
  
  func getCounterTimeValues() -> (minutes: String, seconds: String, milliseconds: String) {
    
    let now = NSDate.timeIntervalSinceReferenceDate
    // 10-8 = 2
    totalTime += now - lastInterval
    // 12-10 = 2
    lastInterval = now
    
    var counterTime = totalTime
    let minutes = Int(counterTime / 60)
    
    counterTime -= (TimeInterval(minutes) * 60)
    let minutesValue = String(format: "%02d", minutes)
    
    let seconds = Int(counterTime)
    counterTime -= (TimeInterval(seconds))
    let secondsValue = String(format: "%02d", seconds)
    
    let milliseconds = Int(counterTime * 100)
    let millisecondsValue = String(format: "%02d", milliseconds)
    
    return (minutesValue, secondsValue, millisecondsValue)
  }

}
