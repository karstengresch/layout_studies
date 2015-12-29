//
//  CounterViewController.swift
//  countidon
//
//  Created by Karsten Gresch on 17.10.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

protocol CounterViewControllerDelegate: class {
  
}

class CounterViewController: UIViewController {

    weak var delegate: CounterViewControllerDelegate?

  @IBOutlet weak var circleGraphView: CircleGraphView?

  override func viewDidLoad() {
    super.viewDidLoad()

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
  
  // MARK: IB related
  @IBAction func cancel() {
    dismissViewControllerAnimated(true, completion: nil)
  }

}
