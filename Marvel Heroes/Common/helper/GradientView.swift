//
//  GradientView.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 04/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {

  @IBInspectable var startColor: UIColor = UIColor.clear {
    didSet {
      colors = [startColor, endColor]
    }
  }

  @IBInspectable var endColor: UIColor = UIColor.black {
    didSet {
      colors = [startColor, endColor]
    }
  }

  @IBInspectable var startPoint: CGPoint = CGPoint(x: 0.5, y: 0) {
    didSet {
      setNeedsDisplay()
    }
  }

  @IBInspectable var endPoint: CGPoint = CGPoint(x: 0.5, y: 1) {
    didSet {
      setNeedsDisplay()
    }
  }

  var colors: [UIColor] {
    didSet {
      setNeedsDisplay()
    }
  }

  required init?(coder aDecoder: NSCoder) {
    self.colors = [startColor, endColor]
    super.init(coder: aDecoder)
      backgroundColor = .clear
  }

  override init(frame: CGRect) {
    self.colors = [startColor, endColor]
    super.init(frame: frame)
      backgroundColor = .clear
  }
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

  override func draw(_ rect: CGRect) {
    let context = UIGraphicsGetCurrentContext()
    let colors = self.colors.map { $0.cgColor } as CFArray
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: nil)

    let pointStart = CGPoint(x: rect.width * startPoint.x, y: rect.height * startPoint.y)
    let pointEnd = CGPoint(x: rect.width * endPoint.x, y: rect.height * endPoint.y)

    context?.drawLinearGradient(gradient!, start: pointStart, end: pointEnd, options: [])
  }

}
