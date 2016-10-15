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
  
  var coutidonItem = CountidonItem()
  
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
  @IBOutlet weak var countdownTextField: NumericTextField!
  @IBOutlet weak var beepEveryTextField: NumericTextField!
  @IBOutlet weak var counterNameTextField: UITextField!
  
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
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    print("indexPath.row: \((indexPath as NSIndexPath).row)" )
    // TODO
    let row = (indexPath as NSIndexPath).row
    switch row {
    case 0 :
      let cell = tableView.dequeueReusableCell(withIdentifier: "TimeToCountdownCell", for: indexPath)
    default:
      let cell = UITableViewCell()
    }
    

    return cell
  }
  
  override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    return nil
  }

  
  
  

}
