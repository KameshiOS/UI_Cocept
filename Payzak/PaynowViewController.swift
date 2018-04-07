//
//  PaynowViewController.swift
//  Payzak
//
//  Created by Lalithbabu Logeshwarrao on 11/07/2017.
//  Copyright © 2017 Payzak Financial Service. All rights reserved.
//

import UIKit

class PaynowViewController: UIViewController, EasyTipViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var payzakHintButton: UIButton!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var impsHintButton: UIButton!
    @IBOutlet weak var enterAmountTF: TextfieildAnimation!
    @IBOutlet weak var selectCategoryTF: TextfieildAnimation!
    @IBOutlet weak var selectBeneficiaryTF: TextfieildAnimation!
    
    
    var beneficiary: [String] = ["Kamesh", "Jagriti Giri", "Simmy", "Vickram", "Aravind"]
    var category: [String] = ["Parlour", "Petrol", "Bank", "Other"]
    
    let beneficiaryPicker = UIPickerView()
    let categoryPicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
        beneficiaryPicker.delegate = self
        beneficiaryPicker.dataSource = self
        
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        //toolBar.barTintColor = UIColor.clear
        toolBar.sizeToFit()
        
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(dismissKeyboard))
        toolBar.setItems([space ,doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        selectCategoryTF.inputView = categoryPicker
        selectBeneficiaryTF.inputView = beneficiaryPicker
        selectCategoryTF.inputAccessoryView = toolBar
        selectBeneficiaryTF.inputAccessoryView = toolBar
        enterAmountTF.inputAccessoryView = toolBar
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func IMPSHintButtonAction(_ sender: Any) {
        toolTip(text: "IMPS Charge as 2.1% extra", sender: sender as! UIButton)
    }
    @IBAction func FavouriteButtonAction(_ sender: Any) {
    }
    @IBAction func PayzakHintButtonAction(_ sender: Any) {
        toolTip(text: "Payzak service charge for each transaction", sender: sender as! UIButton)
    }
    func dismissKeyboard() {
        view.endEditing(true)
    }

    func toolTip(text: String, sender: UIButton) {
        var preference = EasyTipView.Preferences()
        preference.drawing.font = UIFont(name: "Futura-Medium", size: 15)!
        preference.drawing.foregroundColor = UIColor.black
        preference.drawing.backgroundColor = UIColor(displayP3Red: 249/255, green: 227/255, blue:173/255 , alpha: 1) //UIColor(hue: 0.42, saturation: 0.3, brightness: 0.97, alpha: 1)
        preference.drawing.arrowPosition = EasyTipView.ArrowPosition.any
        EasyTipView.globalPreferences = preference
        
        EasyTipView.show(animated: true, forView: sender, withinSuperview: self.navigationController?.view, text: text, preferences: preference, delegate: self)
    }
    override func endAppearanceTransition() {
        print("End Appearence Transition")
    }
    func easyTipViewDidDismiss(_ tipView: EasyTipView) {
        tipView.dismiss()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == beneficiaryPicker {
            return beneficiary.count
        } else {
            return category.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == beneficiaryPicker {
            selectBeneficiaryTF.text = beneficiary[row]
        } else {
            selectCategoryTF.text = category[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == beneficiaryPicker {
            return beneficiary[row]
        } else {
            return category[row]
        }
    }
}
