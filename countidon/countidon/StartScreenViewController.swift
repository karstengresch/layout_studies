//
//  StartScreenViewController.swift
//  countidon
//
//  Created by Karsten Gresch on 15.10.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {
  @IBOutlet weak var upperStartScreenBackgroundView: BackgroundView?
  @IBOutlet weak var lowerStartScreenBackgroundView: BackgroundView?
  @IBOutlet weak var startScreenNavigationItem: UINavigationItem?
  
  @IBOutlet weak var upperShapeButton: ShapeButton?
  @IBOutlet weak var lowerShapeButton: ShapeButton?
  
  let counterViewController = CounterViewController()
  let settingsViewController = SettingsViewController()

  @IBAction func lowerStartScreenButtonPressed(sender: ShapeButton) {
    print("Lower start screen button pressed!")
    self.navigationController?.pushViewController(settingsViewController, animated: true)
    
  }
  
  @IBAction func upperStartScreenButtonPressed(sender: ShapeButton) {
        print("Upper start screen button pressed!")
    self.navigationController?.pushViewController(counterViewController, animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.hidden = true

    
  }

}
