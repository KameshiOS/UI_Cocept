//
//  ButtonAnimation.swift
//  Payzak
//
//  Created by Lalithbabu Logeshwarrao on 03/07/2017.
//  Copyright © 2017 Payzak Financial Service. All rights reserved.
//

import UIKit

@IBDesignable class ButtonAnimation: UIButton {


    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    @IBInspectable var borderColor: UIColor? {
        didSet {
            updateView()
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    func updateView() {
        layer.cornerRadius = cornerRadius
        layer.borderColor = borderColor?.cgColor
        layer.borderWidth = borderWidth
        clipsToBounds = true
    }
    override func prepareForInterfaceBuilder() {
        updateView()
    }
}
