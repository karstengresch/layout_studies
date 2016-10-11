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
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    return paths[0]
  }
  
  func dataFilePathGroups() -> String {
    return (documentsDirectory() as NSString).appendingPathComponent("CountidonGroups.plist")
  }
  
  func dataFilePathSettings() -> String {
    return (documentsDirectory() as NSString).appendingPathComponent("CountidonSettings.plist")
  }
  
  // MARK: Groups
  
  func saveCountidonGroups() {
    let data = NSMutableData()
    let archiver = NSKeyedArchiver(forWritingWith: data)
    archiver.encode(countidonGroups, forKey: COUNTIDON_PERSISTENCE_GROUPS)
    archiver.finishEncoding()
    data.write(toFile: dataFilePathGroups(), atomically: true)
  }
  
  func loadCountidonGroups() {
    let path = dataFilePathGroups()
    if FileManager.default.fileExists(atPath: path) {
      print("CountidonGroups.plist found at \(path)")
      if let data = NSData(contentsOfFile: path) {
        let unarchiver = NSKeyedUnarchiver(forReadingWith: data as Data)
        countidonGroups = unarchiver.decodeObject(forKey: COUNTIDON_PERSISTENCE_GROUPS) as! [CountidonGroup]
        unarchiver.finishDecoding()
      }
    }
  }
  
  // MARK: Settings
  func saveCountidonSettings() {
    let data = NSMutableData()
    let archiver = NSKeyedArchiver(forWritingWith: data)
    archiver.encode(countidonSettings, forKey: COUNTIDON_PERSISTENCE_SETTINGS)
    archiver.finishEncoding()
    data.write(toFile: dataFilePathSettings(), atomically: true)
  }
  
  func loadCountidonSettings() {
    let path = dataFilePathSettings()
    if FileManager.default.fileExists(atPath: path) {
      print("CountidonSettings.plist found at \(path)")
      if let data = NSData(contentsOfFile: path) {
        let unarchiver = NSKeyedUnarchiver(forReadingWith: data as Data)
        countidonSettings = unarchiver.decodeObject(forKey: COUNTIDON_PERSISTENCE_SETTINGS) as! CountidonSettings
        unarchiver.finishDecoding()
      }
    }
  }
  
  // MARK: Defaults and first start
  
  func registerUserDefaults() {
    let defaultsDictionary = ["AppRunsFirstTime": true]
    UserDefaults.standard.register(defaults: defaultsDictionary)
  }
  
  func handleFirstTimeAppStart() {
    let userDefaults = UserDefaults.standard
    let firstTime = userDefaults.bool(forKey: "AppRunsFirstTime")
    if firstTime {
      let firstTimeCountidonGroup = CountidonGroup(name: COUNTIDON_DATA_MODEL_FIRST_TIME_GROUP_NAME)
      let countidonItem = CountidonItem()
      countidonItem.name = "First Counter"
      countidonItem.timeToCountdown = 15
      // scary!
      firstTimeCountidonGroup.countidonItems.append(countidonItem)
      
      countidonGroups.append(firstTimeCountidonGroup)
      saveCountidonGroups()
      saveCountidonSettings()
      userDefaults.set(false, forKey: "AppRunsFirstTime")
      userDefaults.synchronize()
    }
  }
  
  

  
  
}
