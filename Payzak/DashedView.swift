//
//  DashedView.swift
//  Payzak
//
//  Created by Lalithbabu Logeshwarrao on 13/07/2017.
//  Copyright © 2017 Payzak Financial Service. All rights reserved.
//

import UIKit

@IBDesignable class DashedView: UIView {

    @IBInspectable var x: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    @IBInspectable var y: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    @IBInspectable var width: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    @IBInspectable var height: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    @IBInspectable var lineColor: UIColor? {
        didSet {
            updateView()
        }
    }
    func updateView() {
        let rect = CGRect.init(origin: CGPoint.init(x: x, y: y), size: CGSize.init(width: width, height: height))
        let layer = CAShapeLayer.init()
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 8)
        layer.path = path.cgPath
        layer.strokeColor = lineColor?.cgColor
        layer.lineDashPattern = [5, 5, 5, 5, 5]
        layer.backgroundColor = UIColor.clear.cgColor
        layer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(layer)

    }

    override func prepareForInterfaceBuilder() {
        updateView()
    }
}
