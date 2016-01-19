//
//  CountidonDataModel.swift
//  countidon
//
//  Created by Karsten Gresch on 09.01.16.
//  Copyright © 2016 Closure One. All rights reserved.
//
import UIKit
import Foundation

class CountidonDataModel {
  
  var countidonGroups = [CountidonGroup]()
  var countidonSettings = CountidonSettings()
  
  init() {
    print("Data file path for groups is \(dataFilePathGroups())")
    print("Data file path for settings is \(dataFilePathSettings())")
    loadCountidonSettings()
    loadCountidonGroups()
    registerUserDefaults()
    handleFirstTimeAppStart()
  }
  
  // MARK: File related
  func documentsDirectory() -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
    return paths[0]
  }
  
  func dataFilePathGroups() -> String {
    return (documentsDirectory() as NSString).stringByAppendingPathComponent("CountidonGroups.plist")
  }
  
  func dataFilePathSettings() -> String {
    return (documentsDirectory() as NSString).stringByAppendingPathComponent("CountidonSettings.plist")
  }
  
  // MARK: Groups
  
  func saveCountidonGroups() {
    let data = NSMutableData()
    let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
    archiver.encodeObject(countidonGroups, forKey: COUNTIDON_PERSISTENCE_GROUPS)
    archiver.finishEncoding()
    data.writeToFile(dataFilePathGroups(), atomically: true)
  }
  
  func loadCountidonGroups() {
    let path = dataFilePathGroups()
    if NSFileManager.defaultManager().fileExistsAtPath(path) {
      if let data = NSData(contentsOfFile: path) {
        let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
        countidonGroups = unarchiver.decodeObjectForKey(COUNTIDON_PERSISTENCE_GROUPS) as! [CountidonGroup]
        unarchiver.finishDecoding()
      }
    }
  }
  
  // MARK: Settings
  func saveCountidonSettings() {
    let data = NSMutableData()
    let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
    archiver.encodeObject(countidonSettings, forKey: COUNTIDON_PERSISTENCE_SETTINGS)
    archiver.finishEncoding()
    data.writeToFile(dataFilePathSettings(), atomically: true)
  }
  
  func loadCountidonSettings() {
    let path = dataFilePathSettings()
    if NSFileManager.defaultManager().fileExistsAtPath(path) {
      if let data = NSData(contentsOfFile: path) {
        let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
        countidonSettings = unarchiver.decodeObjectForKey(COUNTIDON_PERSISTENCE_SETTINGS) as! CountidonSettings
        unarchiver.finishDecoding()
      }
    }
  }
  
  // MARK: Defaults and first start
  
  func registerUserDefaults() {
    let defaultsDictionary = ["AppRunsFirstTime": true]
    NSUserDefaults.standardUserDefaults().registerDefaults(defaultsDictionary)
  }
  
  func handleFirstTimeAppStart() {
    let userDefaults = NSUserDefaults.standardUserDefaults()
    let firstTime = userDefaults.boolForKey("AppRunsFirstTime")
    if firstTime {
      let firstTimeCountidonGroup = CountidonGroup(name: "First Counters")
      countidonGroups.append(firstTimeCountidonGroup)
      userDefaults.setBool(false, forKey: "AppRunsFirstTime")
      userDefaults.synchronize()
    }
  }

  
  
}
