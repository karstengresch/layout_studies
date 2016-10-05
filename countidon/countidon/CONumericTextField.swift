//
//  CONumericTextField.swift
//  countidon
//
//  Created by Karsten Gresch on 05.10.16.
//  Copyright © 2016 Closure One. All rights reserved.
import UIKit

private var numberTextMaxLength = [UITextField: Int]()
// TODO only allow numbers. wondering if this'll work w/o a UITextField delegate
private var allowedChars = "0123456789"

extension UITextField {
  
  @IBInspectable var maxNumberLength: Int {
    get {
      guard let length = numberTextMaxLength[self] else {
        return Int.max
      }
      return length
    }
    set {
      numberTextMaxLength[self] = newValue
      addTarget(
        self,
        action: #selector(limitLengthAction),
        for: UIControlEvents.editingChanged
      )
    }
  }
  
  func limitLengthAction(textField: UITextField) {
    guard let numberText = textField.text,
      numberText.characters.count > maxNumberLength
      else {
        return
    }
    
    let selection = selectedTextRange
    let maxIndex = numberText.index(numberText.startIndex, offsetBy: maxNumberLength)
    text = numberText.substring(to: maxIndex)
    selectedTextRange = selection
  }
  
}
