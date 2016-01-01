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
  
//   var lastInterval = NSTimeInterval()
//  var timer = NSTimer()
//   var totalTime = NSTimeInterval()
  let maxTime: Double = 12.0

  @IBOutlet weak var percentLabel: UILabel?
  @IBOutlet weak var circleGraphView: CircleGraphView?
  @IBOutlet weak var millisecondsLabel: UILabel?
  @IBOutlet weak var secondsLabel: UILabel?
  @IBOutlet weak var minLabel: UILabel?
  
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
    
    if circleGraphView?.timer.valid != true {
      let selector: Selector = "updateCounter"
      circleGraphView?.timer = NSTimer.scheduledTimerWithTimeInterval(0.01,
        target: self,
        selector: selector,
        userInfo: nil,
        repeats: true)
      circleGraphView?.lastInterval = NSDate.timeIntervalSinceReferenceDate()
    } else {
      circleGraphView?.endArc = 1.0
      circleGraphView?.timer.invalidate()
    }
  }
  
  
  // MARK: IB related
  @IBAction func cancel() {
    dismissViewControllerAnimated(true, completion: nil)
  }
  

}
