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
  var countidonItems = [CountidonItem]()
  
  required init?(coder aDecoder: NSCoder) {
    name = aDecoder.decodeObjectForKey("CountidonGroupName") as! String
    countidonItems = aDecoder.decodeObjectForKey("CountidonItems") as! [CountidonItem]
    super.init()
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(name, forKey: "CountidonGroupName")
    aCoder.encodeObject(countidonItems, forKey: "CountidonItems")
  }
  
  init(name: String) {
    self.name = name
    super.init()
  }

}
