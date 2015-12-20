//
//  StartScreenViewController.swift
//  countidon
//
//  Created by Karsten Gresch on 15.10.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class StartScreenViewController: UITableViewController, CounterViewControllerDelegate, SettingsViewControllerDelegate {
  @IBOutlet weak var startScreenNavigationItem: UINavigationItem?
  
  let counterViewController = CounterViewController()
  let settingsViewController = SettingsViewController()


  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.hidden = true
    setupTableViewDimensions(false)

  }
  
  func setupTableViewDimensions(forLandscape: Bool) {
    let screenRect: CGRect = UIScreen.mainScreen().bounds
    let screenHeight: CGFloat = !forLandscape ? screenRect.size.height : screenRect.size.width
    print("Screen height: \(screenHeight)" )
    tableView.rowHeight = screenHeight / 2
  }
  
  
  
  override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
    if UIDevice.currentDevice().orientation.isLandscape.boolValue {
      print("landscape")
      setupTableViewDimensions(false)
    } else {
      print("not landscape")
      setupTableViewDimensions(true)
    }
  }
  
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: Navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
    if segue.identifier == "CounterViewSegue" {
      let navigationController = segue.destinationViewController as? UINavigationController
      let controller = navigationController?.topViewController as? CounterViewController
      controller?.delegate = self
    }
    
    if segue.identifier == "SettingsViewSegue" {
      let navigationController = segue.destinationViewController as? UINavigationController
      let controller = navigationController?.topViewController as? SettingsViewController
      controller?.delegate = self
    }
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
    
    let circle = cell.viewWithTag(755) as! ShapeButton
    
    switch indexPath {
      case 0:
      print("cellForRowAtIndexPath selected: \(indexPath.row)" )
      cell.backgroundView = cellBackground(UIColor(hue:0.568, saturation:0.673, brightness:0.734, alpha:0.77))
      circle.backgroundColor =  UIColor(hue:0.574, saturation:0.744, brightness:0.486, alpha:1)
      break
      
    case 1:
      print("cellForRowAtIndexPath selected: \(indexPath.row)" )
      cell.backgroundView = cellBackground(UIColor(hue:0.574, saturation:0.744, brightness:0.486, alpha:1))
      circle.backgroundColor =  UIColor(hue:0.568, saturation:0.673, brightness:0.734, alpha:0.77)
      break
    
    default:
      break
    }
    
    
    return cell
  }
  
  func cellBackground(color: UIColor?) -> UIView {
    let backgroundView: UIView = UIView()
    if let customColor = backgroundView.backgroundColor {
      backgroundView.backgroundColor = customColor
    }
    
    backgroundView.layer.masksToBounds = true
    
    return backgroundView
    
  }
  
  
  
  
  // MARK: TableView delegates
  override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    switch indexPath.row {
    case 0:
      print("didDeselectRowAtIndexPath selected: \(indexPath.row)" )
      performSegueWithIdentifier("CounterViewSegue", sender: nil)
      
    case 1:
      print("didDeselectRowAtIndexPath selected: \(indexPath.row)" )
      performSegueWithIdentifier("SettingsViewSegue", sender: nil)
    
    default:
      break // ignore
    }
  }
  

}
