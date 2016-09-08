//
//  SettingsViewController.swift
//  countidon
//
//  Created by Karsten Gresch on 05.11.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate: class {
  
}

class SettingsViewController: UITableViewController {
  
    weak var delegate: SettingsViewControllerDelegate?

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
  
  //MARK: Table related


}
