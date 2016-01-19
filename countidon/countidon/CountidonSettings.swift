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
  var startScreenUpperButtonText = "New"
  var startScreenLowerButtonText = "Settings"
  
  required init?(coder aDecoder: NSCoder) {
    // ??? TODO: Check later if this works: theme = aDecoder.decodeObjectForKey("CountidonSettingTheme") as! Theme
    self.theme = Theme(rawValue: aDecoder.decodeIntegerForKey(COUNTIDON_SETTING_THEME)) ?? .Default
    super.init()
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(self.theme.rawValue, forKey: COUNTIDON_SETTING_THEME)
    aCoder.encodeObject(startScreenUpperButtonText, forKey: COUNTIDON_VC_START_SCREEN_UPPER_BUTTON_TEXT)
    aCoder.encodeObject(startScreenLowerButtonText, forKey: COUNTIDON_VC_START_SCREEN_LOWER_BUTTON_TEXT)
  }
  
  override init() {
    super.init()
  }
  
}

enum Theme: NSInteger {
  case Dark = 1, Light, Mixed, Custom, Default
}