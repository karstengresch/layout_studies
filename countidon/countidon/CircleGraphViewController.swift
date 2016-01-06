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

  @IBOutlet weak var circleGraphView: CircleGraphView?
  @IBOutlet weak var millisecondsLabel: UILabel?
  @IBOutlet weak var secondsLabel: UILabel?
  @IBOutlet weak var minLabel: UILabel?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        circleGraphView?.addTarget(circleGraphView, action: "buttonPressed:", forControlEvents: .TouchUpInside)
      
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
  

  
  
  // MARK: IB related
  @IBAction func cancel() {
    dismissViewControllerAnimated(true, completion: nil)
  }
  

}
