//
//  SignupViewController.swift
//  Payzak
//
//  Created by Lalithbabu Logeshwarrao on 03/07/2017.
//  Copyright © 2017 Payzak Financial Service. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var confirmPasswordTF: TextfieldLeftImage!
    @IBOutlet weak var createPasswordTF: TextfieldLeftImage!
    @IBOutlet weak var emailTF: TextfieldLeftImage!
    @IBOutlet weak var DOBTF: TextfieldLeftImage!
    @IBOutlet weak var mobileNumberTF: TextfieldLeftImage!
    @IBOutlet weak var mobileCodeTF: TextfieldLeftImage!
    @IBOutlet weak var usernameTF: TextfieldLeftImage!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(SignupViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }

    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func DOBTFAction(_ sender: UITextField) {
        let datePickerView: UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        let currentCalendar = Calendar.current
        var yearComponents = DateComponents()
        yearComponents.year = 0
        //let yearsFromNow = currentCalendar.date(byAdding: yearComponents, to: Date())
        //datePickerView.minimumDate = yearsFromNow
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(dateFormat(sender:)), for: .valueChanged)
    }
    func dateFormat(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
        let value = dateFormatter.string(from: sender.date)
        DOBTF.text = value
    }
    @IBAction func ConfirmPasswordAction(_ sender: UITextField) {
        print(sender.text!)
        if sender.text != "" {
        if sender.text == createPasswordTF.text {
            DispatchQueue.main.async {
                UIView.animate(withDuration: 5, delay: 10, options: .curveEaseOut, animations: { 
                    self.confirmPasswordTF.updateRightImage(rightImage: UIImage(named: "correct.png")!)
                }, completion: nil)
            }
        } else {
                self
        }
        }
    }
    @IBAction func SignupButtonAction(_ sender: Any) {
        if usernameTF.text == "Kamesh" {
            DispatchQueue.main.async {
                UIView.animate(withDuration: 5, delay: 5, options: .curveEaseIn, animations: {
                    self.usernameTF.updateRightImage(rightImage: UIImage(named: "correct.png")!)
                }, completion: nil)
            }
        } else {
            DispatchQueue.main.async {
                UIView.animate(withDuration: 5, delay: 5, options: .curveEaseIn, animations: {
                    self.usernameTF.updateRightImage(rightImage: UIImage(named: "calendar.png")!)
                }, completion: nil)
            }
        }
    }
    @IBAction func SubmitButtonAction(_ sender: Any) {
        
    }

}
