//
//  StartScreenTableViewCell.swift
//  countidon
//
//  Created by Karsten Gresch on 26.12.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class StartScreenTableViewCell: UITableViewCell {
  
  @IBOutlet weak var shapeButton: ShapeButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  

  @IBAction func logTap(sender: ShapeButton) {
    print("ShapeButton tapped")
  }
  

}
