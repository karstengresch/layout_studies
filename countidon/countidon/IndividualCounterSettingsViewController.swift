//
//  IndividualCounterSettingsViewController.swift
//  countidon
//
//  Created by Karsten Gresch on 21.01.16.
//  Copyright © 2016 Closure One. All rights reserved.
//

import UIKit
import Foundation

protocol IndividualCounterSettingsViewControllerDelegate: class {
  
}

class IndividualCounterSettingsViewController: UITableViewController {
  
  weak var delegate: IndividualCounterSettingsViewControllerDelegate?
  
  // MARK: IB related
  @IBAction func cancel() {
    dismissViewControllerAnimated(true, completion: nil)
  }
  

}
