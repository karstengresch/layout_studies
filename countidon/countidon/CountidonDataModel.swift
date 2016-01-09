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
  
  init() {
    print("Data file path is \(dataFilePath())")
    loadCountidonGroups()
  }
  
  // MARK: File related
  func documentsDirectory() -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
    return paths[0]
  }
  
  func dataFilePath() -> String {
    return (documentsDirectory() as NSString).stringByAppendingPathComponent("CountidonGroups.plist")
  }
  
  func saveCountidonGroups() {
    let data = NSMutableData()
    let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
    archiver.encodeObject(countidonGroups, forKey: "CountidonGroups")
    archiver.finishEncoding()
    data.writeToFile(dataFilePath(), atomically: true)
  }
  
  func loadCountidonGroups() {
    let path = dataFilePath()
    if NSFileManager.defaultManager().fileExistsAtPath(path) {
      if let data = NSData(contentsOfFile: path) {
        let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
        countidonGroups = unarchiver.decodeObjectForKey("CountidonGroups") as! [CountidonGroup]
        unarchiver.finishDecoding()
      }
    }
  }

  
  
}
