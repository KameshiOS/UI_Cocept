//
//  ProfileDashedView.swift
//  Payzak
//
//  Created by Lalithbabu Logeshwarrao on 14/07/2017.
//  Copyright © 2017 Payzak Financial Service. All rights reserved.
//

import UIKit

@IBDesignable class ProfileDashedView: UIView {

    @IBInspectable var lineWidth: CGFloat = 0.0 {
        didSet {
            updateView()
        }
    }
    @IBInspectable var lineColor: UIColor? {
        didSet {
            updateView()
        }
    }
    @IBInspectable var moveX: CGFloat = 0.0 {
        didSet {
            updateView()
        }
    }
    @IBInspectable var moveY: CGFloat = 0.0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var curveX: CGFloat = 0.0 {
        didSet {
            updateView()
        }
    }
    @IBInspectable var curveY: CGFloat = 0.0 {
        didSet {
            updateView()
        }
    }
    @IBInspectable var controlX1: CGFloat = 0.0 {
        didSet {
            updateView()
        }
    }
    @IBInspectable var controlY1: CGFloat = 0.0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var controlX2: CGFloat = 0.0 {
        didSet {
            updateView()
        }
    }
    @IBInspectable var controlY2: CGFloat = 0.0 {
        didSet {
            updateView()
        }
    }
 
 /*
    @IBInspectable var radius: CGFloat = 0.0 {
        didSet {
            updateView()
        }
    }
    @IBInspectable var startAngle: CGFloat = 0.0 {
        didSet {
            updateView()
        }
    }
    @IBInspectable var endAngle: CGFloat = 0.0 {
        didSet {
            updateView()
        }
    }
 */
    /*
 let rect = CGRect.init(origin: CGPoint.init(x: x, y: y), size: CGSize.init(width: width, height: height))
 let layer = CAShapeLayer.init()
 let path = UIBezierPath(roundedRect: rect, cornerRadius: 8)
 layer.path = path.cgPath
 layer.strokeColor = lineColor?.cgColor
 layer.lineDashPattern = [5, 5, 5, 5, 5]
 layer.backgroundColor = UIColor.clear.cgColor
 layer.fillColor = UIColor.clear.cgColor
 self.layer.addSublayer(layer)
 */
    func updateView() {
        let rect = CGRect(x: moveX, y: moveY, width: curveX, height: curveY)
        
        let layer = CAShapeLayer.init()
        //let path = UIBezierPath(arcCenter: CGPoint(x: moveX, y: moveY), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        //let path = UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.allCorners, cornerRadii: CGSize(width: controlX1, height: controlY1))
        let path = UIBezierPath()
        path.addCurve(to: CGPoint(x: curveX, y: curveY), controlPoint1: CGPoint(x: controlX1, y: controlY1), controlPoint2: CGPoint(x: controlX2, y: controlY2))
        layer.path = path.cgPath
        layer.strokeColor = lineColor?.cgColor
        layer.lineWidth = lineWidth
        layer.backgroundColor = UIColor.clear.cgColor
        layer.fillColor = UIColor.cyan.cgColor
        
        self.layer.addSublayer(layer)
        /*
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(lineWidth)
        context?.setStrokeColor((lineColor?.cgColor)!)
        context?.move(to: CGPoint(x: moveX, y: moveY))
        context?.addCurve(to: CGPoint(x: curveX, y: curveY), control1: CGPoint(x: controlX1, y: controlY1), control2: CGPoint(x: controlX2, y: controlY2))
        context?.strokePath()
 */
    }
    
    override func prepareForInterfaceBuilder() {
        updateView()
    }
}
