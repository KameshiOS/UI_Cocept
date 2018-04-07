//
//  FavouritesNavigationController.swift
//  Payzak
//
//  Created by Lalithbabu Logeshwarrao on 18/07/2017.
//  Copyright © 2017 Payzak Financial Service. All rights reserved.
//

import UIKit

class FavouritesNavigationController: UINavigationController, HalfModalPresentable {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return isHalfModalMaximized() ?.default: .lightContent
    }

}
