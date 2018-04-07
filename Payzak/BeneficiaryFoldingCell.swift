//
//  BeneficiaryFoldingCell.swift
//  Payzak
//
//  Created by Lalithbabu Logeshwarrao on 12/07/2017.
//  Copyright © 2017 Payzak Financial Service. All rights reserved.
//

import UIKit

class BeneficiaryFoldingCell: FoldingCell {
    @IBOutlet weak var selectCategoryTF: TextfieildAnimation!

    @IBOutlet weak var impsSwitch: UISwitch!
    @IBOutlet weak var paynowButton: ButtonAnimation!
    @IBOutlet weak var enterAmountTF: TextfieildAnimation!
    override func animationDuration(_ itemIndex: NSInteger, type: FoldingCell.AnimationType) -> TimeInterval {
        let duration = [0.33, 0.26, 0.26]
        return duration[itemIndex]
    }
}
