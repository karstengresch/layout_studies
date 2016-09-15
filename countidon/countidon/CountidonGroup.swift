https://www.youtube.com/watch?v=uG6AQI0qW4w//
//  CountidonGroup.swift
//  countidon
//
//  Created by Karsten Gresch on 26.12.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit
import Foundation

class CountidonGroup: NSObject, NSCoding {
  public func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: "CountidonGroupName")
    aCoder.encode(countidonItems, forKey: "CountidonItems")
  }

  var name = ""
  var countidonItems = [CountidonItem]()
  
  required init?(coder aDecoder: NSCoder) {
    name = aDecoder.decodeObject(forKey: "CountidonGroupName") as! String
    countidonItems = aDecoder.decodeObject(forKey: "CountidonItems") as! [CountidonItem]
    super.init()
  }
  
  init(name: String) {
    self.name = name
    super.init()
  }

}
