//
//  StartScreenViewController.swift
//  countidon
//
//  Created by Karsten Gresch on 15.10.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class StartScreenViewController: UITableViewController, CounterViewControllerDelegate, SettingsViewControllerDelegate, CircleGraphViewControllerDelegate {
  @IBOutlet weak var startScreenNavigationItem: UINavigationItem?
  
  let counterViewController = CounterViewController()
  let settingsViewController = SettingsViewController()
  let screenRect: CGRect = UIScreen.mainScreen().bounds
  
  var buttonUpperLabelText = "New" // for 1st run
  var buttonLowerLabelText = "Settings"
  
  var countidonDataModel: CountidonDataModel!


  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.hidden = true
    let screenHeight: CGFloat = screenRect.size.height
    tableView.rowHeight = screenHeight / 2

  }
  
  func changeTableViewDimensions(fromLandscape: Bool) {
    let screenHeight: CGFloat = fromLandscape ? screenRect.size.height : screenRect.size.width
    print("Screen height: \(screenHeight)" )
    tableView.rowHeight = screenHeight / 2
  }
  
  
  override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
    switch UIDevice.currentDevice().orientation{
    case .Portrait:
      print("Portrait")
     changeTableViewDimensions(true)
    case .PortraitUpsideDown:
            print("Portrait Upside Down")
     changeTableViewDimensions(true)
    case .LandscapeLeft:
            print("Landscape left")
           changeTableViewDimensions(false)
    case .LandscapeRight:
                  print("Landscape right")
           changeTableViewDimensions(false)
    default:
      print("Unknown orientation")
     changeTableViewDimensions(false)
    }
    tableView.reloadData()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: Navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
    if segue.identifier == "CounterViewSegue" {
      let navigationController = segue.destinationViewController as? UINavigationController
      let controller = navigationController?.topViewController as? CircleGraphViewController
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
    let cell = tableView.dequeueReusableCellWithIdentifier("StartScreenCell", forIndexPath: indexPath) as! StartScreenTableViewCell
    
      cell.shapeButton.addTarget(self, action: "navigateToSubscreen:", forControlEvents: .TouchUpInside)
    
    // let circle = cell.viewWithTag(755) as! ShapeButton
    
    switch indexPath.row {
      case 0:
      print("cellForRowAtIndexPath selected: \(indexPath.row)" )
      cell.backgroundColor = UIColor(hue:0.568, saturation:0.673, brightness:0.734, alpha:0.77)
      cell.shapeButton.backgroundColor =  UIColor(hue:0.574, saturation:0.744, brightness:0.486, alpha:1)
      cell.shapeButton.labelText = "Last"
      cell.shapeButton.segueIdentifier = "CounterViewSegue"
      break
      
    case 1:
      print("cellForRowAtIndexPath selected: \(indexPath.row)" )
      cell.backgroundColor = UIColor(hue:0.574, saturation:0.744, brightness:0.486, alpha:1)
      cell.shapeButton.backgroundColor =  UIColor(hue:0.568, saturation:0.673, brightness:0.734, alpha:0.77)
      cell.shapeButton.labelText = "New/Select"
      cell.shapeButton.segueIdentifier = "SettingsViewSegue"
      break
    
    default:
      print("Illegal indexPath.row value: \(indexPath.row)!")
      break
    }
    
    return cell
  }
  
  // MARK: TableView delegates
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    switch indexPath.row {
    case 0:
      print("didSelectRowAtIndexPath selected: \(indexPath.row)" )
      // performSegueWithIdentifier("CounterViewSegue", sender: nil)
      
    case 1:
      print("didSelectRowAtIndexPath selected: \(indexPath.row)" )
      
    
    default:
      break // ignore
    }
  }
  
  @IBAction func navigateToSubscreen(sender: ShapeButton) {
    
    let currentButton = sender
    
    print("ShapeButton tapped: \(currentButton.segueIdentifier)")
    performSegueWithIdentifier(currentButton.segueIdentifier, sender: sender)
  }
  

}
