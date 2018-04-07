//
//  GradientView.swift
//  Payzak
//
//  Created by Lalithbabu Logeshwarrao on 20/07/2017.
//  Copyright © 2017 Payzak Financial Service. All rights reserved.
//

import UIKit

@IBDesignable class GradientView: UIView {

    
    @IBInspectable var firstColor: UIColor? {
        didSet {
            updateView()
        }
    }
    @IBInspectable var secondColor: UIColor? {
        didSet {
            updateView()
        }
    }
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    func updateView() {
        let layer1 = self.layer as! CAGradientLayer
        layer1.colors = [ firstColor?.cgColor, secondColor?.cgColor ]
        layer1.locations = [ 0.5, 1.0 ]
    }
    override func prepareForInterfaceBuilder() {
        updateView()
    }
}
