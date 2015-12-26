//
//  CountidonGroup.swift
//  countidon
//
//  Created by Karsten Gresch on 26.12.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit
import Foundation

class CountidonGroup: NSObject, NSCoding {
  var name = ""
  
  required init?(coder aDecoder: NSCoder) {
    name = aDecoder.decodeObjectForKey("CountidonGroupName") as! String
    super.init()
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(name, forKey: "CountidonGroupName")
  }
  
  init(name: String) {
    self.name = name
    super.init()
  }

}
