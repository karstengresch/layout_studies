//
//  CircleGraphViewController.swift
//  CounterAnimations
//
//  Created by Karsten Gresch on 05.10.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

protocol CircleGraphViewControllerDelegate: class {
  
}

class CircleGraphViewController: UIViewController {
  
  weak var delegate: CircleGraphViewControllerDelegate?
  
  var lastInterval = NSTimeInterval()
  var timer = NSTimer()
  var totalTime = NSTimeInterval()
  let maxTime: Double = 12.0

  @IBOutlet weak var percentLabel: UILabel?

  @IBOutlet weak var timeLabel: UILabel?
  
  @IBOutlet weak var circleGraphView: CircleGraphView?
  
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
  
  @IBAction func slider(sender: UISlider) {
    // print("Sender value: \(sender.value)")
    // print("End arc value: \(circleGraphView?.endArc)")
    circleGraphView?.endArc = CGFloat(sender.value)
    percentLabel?.text = String(format: " %5.2f %%", sender.value * 100)
    
  }
  @IBAction func startButtonPressed(sender: AnyObject) {
    // print("Start button pressed")
    
    circleGraphView?.endArc = 0
    
    if !timer.valid {
      let selector: Selector = "updateCounter"
      timer = NSTimer.scheduledTimerWithTimeInterval(0.01,
        target: self,
        selector: selector,
        userInfo: nil,
        repeats: true)
      lastInterval = NSDate.timeIntervalSinceReferenceDate()
    } else {
      circleGraphView?.endArc = 1.0
      timer.invalidate()
    }
  }
  
  
  // HERE I AM
  
  func updateCounter() {
    
    let now = NSDate.timeIntervalSinceReferenceDate()
    totalTime += now - lastInterval
    lastInterval = now
    
    if(totalTime < maxTime) {
      let timeGone = totalTime / maxTime
      circleGraphView?.endArc = CGFloat(timeGone)
      percentLabel?.text = String(format: " %5.2f %%", timeGone * 100)
      print("\(timeGone)")
      
      let counterTimeValues = getCounterTimeValues()
      timeLabel?.text = "\(counterTimeValues.minutes):\(counterTimeValues.seconds):\(counterTimeValues.milliseconds)"
      
    }
    else {
      circleGraphView?.endArc = 1.0
      percentLabel?.text = "100%"
      timeLabel?.text = String(format: "%2.2f", maxTime)
      let counterTimeValues = getCounterTimeValues()
      timeLabel?.text = "\(counterTimeValues.minutes):\(counterTimeValues.seconds):00"
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
  
  // MARK: IB related
  @IBAction func cancel() {
    dismissViewControllerAnimated(true, completion: nil)
  }
  

}
