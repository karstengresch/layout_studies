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

class CircleGraphViewController: UIViewController, IndividualCounterSettingsViewControllerDelegate {
  
  weak var delegate: CircleGraphViewControllerDelegate?

//   var lastInterval = NSTimeInterval()
//  var timer = NSTimer()
//   var totalTime = NSTimeInterval()
  let maxTime: Double = 12.0

  @IBOutlet weak var circleGraphView: CircleGraphView?

  
    override func viewDidLoad() {
        super.viewDidLoad()
      circleGraphView?.arcWidth = 12.0
      circleGraphView?.addTarget(circleGraphView, action: #selector(CircleGraphView.buttonPressed), for: .touchDown)
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  // MARK: IB related
  @IBAction func cancel() {
    dismiss(animated: true, completion: nil)
  }
  
  // MARK: Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "QuickViewSetupSegue" {
      let navigationController = segue.destination as? UINavigationController
      let controller = navigationController?.topViewController as? IndividualCounterSettingsViewController
      controller?.delegate = self
    }
  }

}
