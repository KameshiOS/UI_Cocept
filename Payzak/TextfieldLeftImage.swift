//
//  TextfieldLeftImage.swift
//  Payzak
//
//  Created by Lalithbabu Logeshwarrao on 03/07/2017.
//  Copyright © 2017 Payzak Financial Service. All rights reserved.
//

import UIKit

@IBDesignable class TextfieldLeftImage: UITextField {

    @IBInspectable var leftimage: UIImage? {
        didSet {
            updateView()
        }
    }
    @IBInspectable var leftPadding: CGFloat = 0.0 {
        didSet {
            updateView()
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    func updateView() {
        if let image = leftimage {
            leftViewMode = .always
            let imageView = UIImageView(frame: CGRect(x: leftPadding, y: 0, width: 20, height: 20))
            imageView.image = image
            
            var width = leftPadding + 20
            
            if borderStyle == UITextBorderStyle.none || borderStyle == UITextBorderStyle.line {
                width = width + 5
            }
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            view.addSubview(imageView)
            leftView = view
        } else {
            leftViewMode = .never
        }
    }

    func updateRightImage(rightImage: UIImage) {
        
        rightViewMode = .always
        let imageview = UIImageView(frame: CGRect(x: frame.origin.x - 5, y: 0, width: 20, height: 20))
        imageview.image = rightImage
        
        var width = frame.origin.x - 5 + 20
        
        if borderStyle == UITextBorderStyle.none || borderStyle == UITextBorderStyle.line {
            width = width + 5
        }
        let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
        view.addSubview(imageview)
        rightView = view
        
    }
}
