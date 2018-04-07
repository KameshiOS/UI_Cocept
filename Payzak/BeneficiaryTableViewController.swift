//
//  BeneficiaryTableViewController.swift
//  Payzak
//
//  Created by Lalithbabu Logeshwarrao on 12/07/2017.
//  Copyright © 2017 Payzak Financial Service. All rights reserved.
//

import UIKit
import FoldingCell

fileprivate struct C {
    struct CellHeight {
        static let close: CGFloat = 110
        static let open: CGFloat = 460
    }
}
class BeneficiaryTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var addBeneficiaryView: UIView!
    var category: [String] = ["Parlour", "Petrol", "Bank","Shopping", "Health", "Other"]
    let categoryPicker = UIPickerView()
    
    var cellHeights: [CGFloat] = []
    var index = IndexPath()
    var picketString =  String()
    var toolBar = UIToolbar()
    
    
    var blurView: UIVisualEffectView!
    var blurEffect : UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        cellHeights = (0..<100).map { _ in C.CellHeight.close }
        print(cellHeights)
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        
        toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        //toolBar.barTintColor = UIColor.clear
        toolBar.sizeToFit()
        
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(pickerDoneButton))
        toolBar.setItems([space ,doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
    }

        func pickerDoneButton() {
        self.tableView.reloadData()
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func AddBeneficiaryButtonAction(_ sender: Any) {
        animationIn()
    }

    func animationIn() {
        blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.bounds
        
        self.view.addSubview(blurView)
        
        // add item view over blur View
        blurView.addSubview(self.addBeneficiaryView)
        //self.CreateTicketView.frame = CGRect(x: 0, y: 0, width: 300, height: 440)
        self.addBeneficiaryView.center = blurView.center
        self.addBeneficiaryView.layer.cornerRadius = self.addBeneficiaryView.frame.size.width / 30
        self.addBeneficiaryView.clipsToBounds = true
        self.addBeneficiaryView.layer.borderWidth = 1
        self.addBeneficiaryView.layer.borderColor = UIColor.clear.cgColor
        self.addBeneficiaryView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        self.addBeneficiaryView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.blurView.effect = self.blurEffect
            self.addBeneficiaryView.alpha = 1
            self.addBeneficiaryView.transform = CGAffineTransform.identity
        }
        
    }
    func animateOut() {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.addBeneficiaryView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.addBeneficiaryView.alpha = 0
            
            self.blurView.effect = nil
        }) { (success: Bool) in
            self.addBeneficiaryView.removeFromSuperview()
            self.blurView.removeFromSuperview()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 100
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BeneficiaryFoldingCell
        
        
        cell.selectCategoryTF.inputView = categoryPicker
        cell.selectCategoryTF.inputAccessoryView = toolBar
        cell.selectCategoryTF.text = self.picketString
        
        cell.paynowButton.addTarget(self, action: #selector(paynowAction(sender:)), for: .touchUpInside)
        TableAnimation.animateCell(cell: cell, withTransform: TableAnimation.Wave, andDuration: 0.5)
        cell.backgroundColor = UIColor.clear
        return cell
    }
    func paynowAction(sender: UIButton) {
        // Do Paynow button Action
        print("Paynow Screen")
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard case let cell as BeneficiaryFoldingCell = tableView.cellForRow(at: indexPath) else {
            return
        }
        
        cell.selectCategoryTF.text = ""
        cell.enterAmountTF.text = ""
        var duration = 0.0
        print(cellHeights[indexPath.row])
        if cellHeights[indexPath.row] == C.CellHeight.close {
            cellHeights[indexPath.row] = C.CellHeight.open
            print(cellHeights[indexPath.row])
            cell.selectedAnimation(true, animated: true, completion: nil)
            duration = 0.5
            print(indexPath.row)
            self.index = indexPath
        } else {
            cellHeights[indexPath.row] = C.CellHeight.close
            cell.selectedAnimation(false, animated: true, completion: nil)
            duration = 1.1
        }
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { 
            _ in
            tableView.beginUpdates()
            tableView.endUpdates()
        }, completion: nil)
 }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if case let cell as BeneficiaryFoldingCell = cell {
            if cellHeights[indexPath.row] == C.CellHeight.close {
                cell.selectedAnimation(false, animated: false, completion: nil)
            } else {
                cell.selectedAnimation(true, animated: false, completion: nil)
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return category.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let beneficiaryCell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: index) as! BeneficiaryFoldingCell
        print(index.row)
        self.picketString =  category[row]
        print(self.picketString)
        //self.tableView.reloadData()
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return category[row]
    }
}
