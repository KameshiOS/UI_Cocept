//
//  RecentActivityTableViewCell.swift
//  Payzak
//
//  Created by Lalithbabu Logeshwarrao on 15/07/2017.
//  Copyright © 2017 Payzak Financial Service. All rights reserved.
//

import UIKit

class RecentActivityTableViewCell: UITableViewCell {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var lineView: ViewAnimation!
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryView: ViewAnimation!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
