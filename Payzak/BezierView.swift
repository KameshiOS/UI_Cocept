//
//  BezierView.swift
//  Payzak
//
//  Created by Lalithbabu Logeshwarrao on 14/07/2017.
//  Copyright © 2017 Payzak Financial Service. All rights reserved.
//

import UIKit

@IBDesignable class BezierView: UIView {

    @IBInspectable var lineWidth: CGFloat = 0 {
        didSet {
            quadCurve()
        }
    }
    @IBInspectable var x: CGFloat = 0 {
        didSet {
            quadCurve()
        }
    }
    @IBInspectable var y: CGFloat = 0 {
        didSet {
            quadCurve()
        }
    }
    @IBInspectable var curveX: CGFloat = 0 {
        didSet {
            quadCurve()
        }
    }
    @IBInspectable var curveY: CGFloat = 0 {
        didSet {
            quadCurve()
        }
    }
    @IBInspectable var controlX1: CGFloat = 0 {
        didSet {
            quadCurve()
        }
    }
    @IBInspectable var controlY1: CGFloat = 0 {
        didSet {
            quadCurve()
        }
    }
    /*
    @IBInspectable var controlX2: CGFloat = 0 {
        didSet {
            updatePath()
        }
    }
    @IBInspectable var controlY2: CGFloat = 0 {
        didSet {
            updatePath()
        }
    }
 
    func updatePath() {
        let path = UIBezierPath()
        path.lineWidth = lineWidth
        
        path.move(to: CGPoint(x: x, y: y))
        path.addCurve(to: CGPoint(x: curveX, y: curveY), controlPoint1: CGPoint(x: controlX1, y: controlY1), controlPoint2: CGPoint(x: controlX2, y: controlY2))
        let layer = CAShapeLayer.init()
        
        layer.path = path.cgPath
        layer.strokeColor = UIColor.green.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = lineWidth
        self.layer.addSublayer(layer)
        
        
    }
 */
    func quadCurve() {
        let path = UIBezierPath()
        //path.lineWidth = lineWidth
        
        path.move(to: CGPoint(x: x, y: y))
        path.addQuadCurve(to: CGPoint(x: curveX, y: curveY), controlPoint: CGPoint(x: controlX1, y: controlY1))
        let layer = CAShapeLayer.init()
        
        layer.path = path.cgPath
        layer.strokeColor = UIColor.green.cgColor
        layer.fillColor = UIColor.white.cgColor
        layer.lineWidth = lineWidth
        self.layer.addSublayer(layer)

    }

}
