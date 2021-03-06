//
//  CountidonSettings.swift
//  countidon
//
//  Created by Karsten Gresch on 26.12.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

/**
 A class for all general settings (e.g. theme, init screen).
 Individual counter settings in class CountidonItem
*/
class CountidonSettings: NSObject, NSCoding {
  var theme = Theme.Default
  var startScreenUpperButtonText = "New" // TODO constant
  var startScreenLowerButtonText = "Settings"
  
  required init?(coder aDecoder: NSCoder) {
    self.theme = Theme(rawValue: aDecoder.decodeInteger(forKey: COUNTIDON_SETTING_THEME)) ?? .Default
    self.startScreenUpperButtonText = aDecoder.decodeObject(forKey: COUNTIDON_VC_START_SCREEN_UPPER_BUTTON_TEXT) as! String
    self.startScreenLowerButtonText = aDecoder.decodeObject(forKey: COUNTIDON_VC_START_SCREEN_LOWER_BUTTON_TEXT) as! String
    super.init()
  }
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(self.theme.rawValue, forKey: COUNTIDON_SETTING_THEME)
    aCoder.encode(startScreenUpperButtonText, forKey: COUNTIDON_VC_START_SCREEN_UPPER_BUTTON_TEXT)
    aCoder.encode(startScreenLowerButtonText, forKey: COUNTIDON_VC_START_SCREEN_LOWER_BUTTON_TEXT)
  }
  
  override init() {
    super.init()
  }
  
}

enum Theme: Int {
  case Dark = 1, Light, Mixed, Custom, Default
}
