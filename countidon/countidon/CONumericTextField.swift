//
//  CONumericTextField.swift
//  countidon
//
//  Created by Karsten Gresch on 05.10.16.
//  Copyright © 2016 Closure One. All rights reserved.
import UIKit


class NumericTextField: UITextField, UITextFieldDelegate {
  
  private var numberTextMaxLength = [UITextField: Int]()
  private var allowedCharacters = "0123456789"
  
    
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
    // TODO
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
