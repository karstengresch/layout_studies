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

class IndividualCounterSettingsViewController: UITableViewController, UITextFieldDelegate {
  
  weak var delegate: IndividualCounterSettingsViewControllerDelegate?
  
  // MARK: IB related
  @IBAction func cancel() {
    print("cancel")
    // TODO - Try protocol based approach:
    /*
     let navigationController = storyboard!.instantiateViewControllerWithIdentifier("ListDetailViewC≤ontroller") as! UINavigationController
     let controller = navigationController.topViewController as! ListDetailViewController
     controller.delegate = self
     
     let checklist = dataModel.checklists[indexPath.row]
     controller.checklistToEdit = checklist
     presentViewController(navigationController, animated: true, completion: nil)
     
     */
    
    
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
  
  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    
    
    
    return true
    
  }
  
  func textField(textFieldToChange: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
    let characterSetAllowed = NSCharacterSet.punctuationCharacterSet()
    if let rangeOfCharactersAllowed = string.rangeOfCharacterFromSet(characterSetAllowed, options: .CaseInsensitiveSearch) {
      // make sure it's all of them
      return rangeOfCharactersAllowed.count == string.characters.count
    } else  {
      // none of the characters are from the allowed set
      return false
    }
  }
  
  
  
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
