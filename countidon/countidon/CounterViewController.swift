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
  
  @IBAction func cancel() {
    dismissViewControllerAnimated(true, completion: nil)
  }

}
