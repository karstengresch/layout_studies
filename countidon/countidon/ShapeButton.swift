//
//  ShapeButton.swift
//  countidon
//
//  Created by Karsten Gresch on 15.10.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

@IBDesignable
class ShapeButton: UIControl {
  
  // source: http://stackoverflow.com/questions/27432736/how-to-create-an-ibinspectable-of-type-enum?rq=1
  enum CornerType: String {
    case Rounded = "rounded"
    case Circle = "circle"
  }
  
  var cornerType = CornerType.Rounded
  var labelText = "ShapeButton"
  var segueIdentifier = ""
  
  
  @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'cornerType' instead.")
  @IBInspectable var cornerTypeName: String? {
    willSet {
      if let newCornerType = CornerType(rawValue: newValue?.lowercased() ?? "") {
        cornerType = newCornerType
      }
    }
  }
  
 
  @IBInspectable var radiusWidth: CGFloat = 30
  @IBInspectable var radiusHeight: CGFloat = 30
  @IBInspectable let shapeButtonLabel: UILabel = UILabel(frame: CGRect(x: 20.0, y: 30.0, width: 300.0, height: 30.0))
  
  
  override func layoutSubviews() {

    let shapeLayer = CAShapeLayer()
    
    switch cornerType {
    case .Rounded:
      shapeLayer.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: [UIRectCorner.topLeft,  UIRectCorner.topRight, UIRectCorner.bottomLeft, UIRectCorner.bottomRight], cornerRadii: CGSize(width: 30, height: 30)).cgPath
    case .Circle:
      shapeLayer.path = UIBezierPath(ovalIn: self.bounds).cgPath
    }
    layer.mask = shapeLayer
    setupLabels()
  }
  
  
  func setupLabels() {
    shapeButtonLabel.numberOfLines = 1;
    shapeButtonLabel.baselineAdjustment = UIBaselineAdjustment.alignBaselines
    shapeButtonLabel.adjustsFontSizeToFitWidth = true
    shapeButtonLabel.frame = self.bounds
    shapeButtonLabel.backgroundColor = UIColor.clear
    shapeButtonLabel.text = self.labelText
    shapeButtonLabel.textColor = UIColor.white
    shapeButtonLabel.font = UIFont.systemFont(ofSize: 28.0)
    shapeButtonLabel.textAlignment = .center
    shapeButtonLabel.drawText(in: self.bounds)
    self.addSubview(shapeButtonLabel)
    self.setNeedsDisplay()
  }

}

import UIKit.UIGestureRecognizerSubclass

private class TapRecognizer: UITapGestureRecognizer {
  
  
  func handleTap(sender: UITapGestureRecognizer) {
   print("Tapped!")
   if sender.state == .ended {
    // handling code
       print("Tap ended!")
   }
  }
  
}
