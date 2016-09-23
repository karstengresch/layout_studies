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
    return 0
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return 0
  }
  

}
