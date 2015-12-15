//
//  CountidonEntry.swift
//  countidon
//
//  Created by Karsten Gresch on 15.12.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class CountidonEntry: NSObject {
  
  var name = "Counter"
  var counterType: CounterType = .circle
  
  enum CounterType: String {
    case digital = "Digital Clock"
    case circle = "Circle"
    case burning = "Burning"
    case analog = "Analog Clock"
    case multi = "Multi Circle"
  }
  
  init(name: String, counterType: CounterType) {
    self.name = name
    self.counterType = counterType
  }
  

}
