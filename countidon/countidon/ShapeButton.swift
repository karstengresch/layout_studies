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
  
  
  @available(*, unavailable, message="This property is reserved for Interface Builder. Use 'cornerType' instead.")
  @IBInspectable var cornerTypeName: String? {
    willSet {
      if let newCornerType = CornerType(rawValue: newValue?.lowercaseString ?? "") {
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
    

    
  }
  
  
  func label() {
    shapeButtonLabel.frame = self.frame
    shapeButtonLabel.backgroundColor = UIColor.clearColor()
    shapeButtonLabel.text = "This is text"
    shapeButtonLabel.textColor = UIColor.whiteColor()
    // shapeButtonLabel.center = CGPoint(x: self.bounds.x / 2.0, y: self.bounds.y / 2.0)
    shapeButtonLabel.font = UIFont.systemFontOfSize(10.0)
    shapeButtonLabel.drawTextInRect(self.bounds)
    
    shapeButtonLabel.numberOfLines = 1;
    shapeButtonLabel.baselineAdjustment = UIBaselineAdjustment.AlignBaselines
    //     shapeButtonLabel.adjustsFontSizeToFitWidth = true
    shapeButtonLabel.minimumScaleFactor = CGFloat(8.0/10.0)
    
    self.addSubview(shapeButtonLabel)
    self.setNeedsDisplay()
    
  }
  
  
  
  
  



}
