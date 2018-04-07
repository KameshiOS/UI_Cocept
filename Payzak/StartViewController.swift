//
//  StartViewController.swift
//  Payzak
//
//  Created by Lalithbabu Logeshwarrao on 01/07/2017.
//  Copyright © 2017 Payzak Financial Service. All rights reserved.
//

import UIKit
import Auk
class StartViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var titleText: [String] = ["Payzak", "Scan Card","Customer Care", "Transfer Immediately", "Notification"]
    var descriptionText: [String] = ["Worried! about GST, transfer amount using our Payzak App to any merchant or to your beneficiary on single click", "Having problem while entering the card details, just scan the card using our Artificial Intelligence", "If there is any problem with our service, there is 24 * 7 friendly customer care service for your guidance", "Transfer amount to your beneficiary as quick as possible, without any bank application", "Immediate notification send on your successfull transaction"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let image1 = UIImage(named: "1.jpg") {
            scrollView.auk.show(image: image1)
        }
        if let image1 = UIImage(named: "scanCard.jpg") {
            scrollView.auk.show(image: image1)
        }
        if let image1 = UIImage(named: "customerCare.jpg") {
            scrollView.auk.show(image: image1)
        }
        if let image1 = UIImage(named: "transfer.jpg") {
            scrollView.auk.show(image: image1)
        }
        if let image1 = UIImage(named: "notification.jpeg") {
            scrollView.auk.show(image: image1)
        }
        titleLabel.text = titleText[0]
        descriptionTextView.text = descriptionText[0]
        scrollView.auk.settings.contentMode = .scaleToFill
        
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print(scrollView.auk.currentPageIndex!)
        let i = scrollView.auk.currentPageIndex!
        titleLabel.text = titleText[i]
        descriptionTextView.text = descriptionText[i]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func LoginButtonAction(_ sender: Any) {
    }
    
    @IBAction func SignupButtonAction(_ sender: Any) {
    }
}
