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
  @IBInspectable let shapeButtonLabel: UILabel = UILabel(frame: CGRectMake(20.0, 30.0, 300.0, 30.0))
  
  
  override func layoutSubviews() {

    let shapeLayer = CAShapeLayer()
    
    switch cornerType {
    case .Rounded:
      shapeLayer.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: [UIRectCorner.TopLeft,  UIRectCorner.TopRight, UIRectCorner.BottomLeft, UIRectCorner.BottomRight], cornerRadii: CGSize(width: 30, height: 30)).CGPath
    case .Circle:
      shapeLayer.path = UIBezierPath(ovalInRect: self.bounds).CGPath
    }
    layer.mask = shapeLayer
    setupLabels()
  }
  
  
  func setupLabels() {
    shapeButtonLabel.numberOfLines = 1;
    shapeButtonLabel.baselineAdjustment = UIBaselineAdjustment.AlignBaselines
    shapeButtonLabel.adjustsFontSizeToFitWidth = true
    shapeButtonLabel.frame = self.bounds
    shapeButtonLabel.backgroundColor = UIColor.clearColor()
    shapeButtonLabel.text = self.labelText
    shapeButtonLabel.textColor = UIColor.whiteColor()
    shapeButtonLabel.font = UIFont.systemFontOfSize(28.0)
    shapeButtonLabel.textAlignment = .Center
    shapeButtonLabel.drawTextInRect(self.bounds)
    self.addSubview(shapeButtonLabel)
    self.setNeedsDisplay()
  }

}

import UIKit.UIGestureRecognizerSubclass

private class TapRecognizer: UITapGestureRecognizer {
  
  
  func handleTap(sender: UITapGestureRecognizer) {
   print("Tapped!")
   if sender.state == .Ended {
    // handling code
       print("Tap ended!")
   }
  }
  
}
