//
//  StartScreenViewController.swift
//  countidon
//
//  Created by Karsten Gresch on 15.10.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class StartScreenViewController: UITableViewController {
  @IBOutlet weak var upperStartScreenBackgroundView: BackgroundView?
  @IBOutlet weak var lowerStartScreenBackgroundView: BackgroundView?
  @IBOutlet weak var startScreenNavigationItem: UINavigationItem?
  
  @IBOutlet weak var upperShapeButton: ShapeButton?
  @IBOutlet weak var lowerShapeButton: ShapeButton?
  
  let counterViewController = CounterViewController()
  let settingsViewController = SettingsViewController()

  @IBAction func lowerStartScreenButtonPressed(sender: ShapeButton) {
    print("Lower start screen button pressed!")
    // self.navigationController?.pushViewController(settingsViewController, animated: true)
    
  }
  
  @IBAction func upperStartScreenButtonPressed(sender: ShapeButton) {
        print("Upper start screen button pressed!")
    // self.navigationController?.pushViewController(counterViewController, animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.hidden = true
    setupTableViewDimensions()

  }
  
  func setupTableViewDimensions() {
    // tableView.rowHeight = UITableViewAutomaticDimension
    tableView.rowHeight = tableView.frame.height / 2
//     tableView.frame.height = super.screem
    
//     tableView.estimatedRowHeight = tableView.
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    
    return 2
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("StartScreenCell", forIndexPath: indexPath)
    
    
    return cell
  }
  

}
