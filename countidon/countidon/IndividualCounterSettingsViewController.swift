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
    print("cancel")
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func cancelBarButton(sender: UIBarButtonItem) {
       dismiss(animated: true, completion: nil)
  }
  
  
  @IBAction func navigationBarButtonLeftClicked(sender: UIBarButtonItem) {
       dismiss(animated: true, completion: nil)
  }
  
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 3
  }
  
  // MARK: UITextField related.
  @IBOutlet weak var countdownTextField: UITextField!
  
  // MARK: Table View related.
  
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return 2
  }
  
  override func tableView(_ tableView: UITableView,
                          didSelectRowAt indexPath: IndexPath) {
    if let cell = tableView.cellForRow(at: indexPath) {
      if cell.accessoryType == .none {
        cell.accessoryType = .checkmark
      } else {
        cell.accessoryType = .none
      }
    }
    tableView.deselectRow(at: indexPath, animated: true)
  }
  

}
