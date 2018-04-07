//
//  LabelLine.swift
//  Payzak
//
//  Created by Lalithbabu Logeshwarrao on 14/07/2017.
//  Copyright © 2017 Payzak Financial Service. All rights reserved.
//

import UIKit

@IBDesignable class LabelLine: UILabel {


    @IBInspectable var height: CGFloat = 0 {
        didSet {
            updateLine()
        }
    }
    @IBInspectable var frameY: CGFloat = 0 {
        didSet {
            updateLine()
        }
    }
    @IBInspectable var lineColor: UIColor? {
        didSet {
            updateLine()
        }
    }
    
    func updateLine() {
        let lineView = UIView(frame: CGRect(x: 0, y: self.frame.height - frameY, width: frame.width + 100, height: height))
        lineView.backgroundColor = lineColor
        self.addSubview(lineView)
    }
    
    override func prepareForInterfaceBuilder() {
        updateLine()
    }
}
