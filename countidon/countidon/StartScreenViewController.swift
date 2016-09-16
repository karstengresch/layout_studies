//
//  StartScreenViewController.swift
//  countidon
//
//  Created by Karsten Gresch on 15.10.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class StartScreenViewController: UITableViewController, CounterViewControllerDelegate, SettingsViewControllerDelegate, CircleGraphViewControllerDelegate, IndividualCounterSettingsViewControllerDelegate {
  @IBOutlet weak var startScreenNavigationItem: UINavigationItem?
  
  let counterViewController = CounterViewController()
  let settingsViewController = SettingsViewController()
  let screenRect: CGRect = UIScreen.main.bounds
  
  var countidonDataModel: CountidonDataModel!  

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.isHidden = true
    let screenHeight: CGFloat = screenRect.size.height
    tableView.rowHeight = screenHeight / 2

  }
  
  func changeTableViewDimensions(fromLandscape: Bool) {
    let screenHeight: CGFloat = fromLandscape ? screenRect.size.height : screenRect.size.width
    print("Screen height: \(screenHeight)" )
    tableView.rowHeight = screenHeight / 2
  }
  
  
  override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
    switch UIDevice.current.orientation{
    case .portrait:
      print("Portrait")
     changeTableViewDimensions(fromLandscape: true)
    case .portraitUpsideDown:
            print("Portrait Upside Down")
     changeTableViewDimensions(fromLandscape: true)
    case .landscapeLeft:
            print("Landscape left")
           changeTableViewDimensions(fromLandscape: false)
    case .landscapeRight:
                  print("Landscape right")
           changeTableViewDimensions(fromLandscape: false)
    default:
      print("Unknown orientation")
     changeTableViewDimensions(fromLandscape: false)
    }
    tableView.reloadData()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: Navigation
  func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
    if segue.identifier == "CounterViewSegue" {
      let navigationController = segue.destination as? UINavigationController
      let controller = navigationController?.topViewController as? CircleGraphViewController
      controller?.delegate = self
    }
    
    if segue.identifier == "SettingsViewSegue" {
      let navigationController = segue.destination as? UINavigationController
      let controller = navigationController?.topViewController as? SettingsViewController
      controller?.delegate = self
    }
    
    if segue.identifier == "QuickViewSetupSegue" {
      let navigationController = segue.destination as? UINavigationController
      let controller = navigationController?.topViewController as? IndividualCounterSettingsViewController
      controller?.delegate = self
    }
    
    
  }
  
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return 2
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("StartScreenCell", forIndexPath: indexPath) as! StartScreenTableViewCell
    
      cell.shapeButton.addTarget(self, action: #selector(StartScreenViewController.navigateToSubscreen(_:)), forControlEvents: .TouchUpInside)
    
    // let circle = cell.viewWithTag(755) as! ShapeButton
    
    switch indexPath.row {
      case 0:
      print("cellForRowAtIndexPath selected: \(indexPath.row)" )
      cell.backgroundColor = UIColor(hue:0.568, saturation:0.673, brightness:0.734, alpha:0.77)
      cell.shapeButton.backgroundColor =  UIColor(hue:0.574, saturation:0.744, brightness:0.486, alpha:1)
      cell.shapeButton.labelText = countidonDataModel.countidonSettings.startScreenUpperButtonText
      cell.shapeButton.segueIdentifier = "CounterViewSegue"
      break
      
    case 1:
      print("cellForRowAtIndexPath selected: \(indexPath.row)" )
      cell.backgroundColor = UIColor(hue:0.574, saturation:0.744, brightness:0.486, alpha:1)
      cell.shapeButton.backgroundColor =  UIColor(hue:0.568, saturation:0.673, brightness:0.734, alpha:0.77)
      cell.shapeButton.labelText = countidonDataModel.countidonSettings.startScreenLowerButtonText
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
