//
//  StartScreenViewController.swift
//  countidon
//
//  Created by Karsten Gresch on 15.10.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {
  @IBOutlet weak var upperStartScreenBackgroundView: BackgroundView!
  @IBOutlet weak var lowerStartScreenBackgroundView: BackgroundView!
  @IBOutlet weak var startScreenNavigationItem: UINavigationItem!
  

  @IBAction func lowerStartScreenButtonPressed(sender: ShapeButton) {
    
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.hidden = true

    
  }

}
