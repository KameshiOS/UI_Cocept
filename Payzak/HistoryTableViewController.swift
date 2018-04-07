//
//  HistoryTableViewController.swift
//  Payzak
//
//  Created by Lalithbabu Logeshwarrao on 13/07/2017.
//  Copyright © 2017 Payzak Financial Service. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {

    @IBOutlet weak var filterButton: UIBarButtonItem!
    let succesArray = [2, 0, 1, 3, 2, 0, 1, 1, 0, 2]
    let categoryImageArray = ["groceries.png", "liquid.png", "mail.png", "coffee.png", "liquid.png", "mail.png", "groceries.png", "coffee.png", "liquid.png", "mail.png"]
    let filterString = ["Transaction History", "Refund History"]
    let filterPicker = UIPickerView()
     var toolBar = UIToolbar()
    
    var blurView: UIVisualEffectView!
    var blurEffect : UIVisualEffect!
    
    @IBOutlet var filterView: UIView!

    var filterView1 = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
       
                
    }
    
    @IBAction func CancelFilterButtonAction(_ sender: Any) {
       // self.filterView.removeFromSuperview()
        tableView.isScrollEnabled = true
        filterButton.isEnabled = true
        self.filterView1.removeFromSuperview()
        self.blurView.removeFromSuperview()
        
    }
    @IBAction func FilterButtonAction(_ sender: Any) {
        tableView.isScrollEnabled = false
        filterButton.isEnabled = false
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .transitionCurlUp, animations: {
            self.blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
            self.blurView = UIVisualEffectView(effect: self.blurEffect)
            self.blurView.frame = self.view.bounds
            // add item view over blur View
            
            self.filterView1 = UIView(frame: CGRect(x: self.tableView.frame.width - 240, y: 60, width: 240, height: 122))
            self.filterView.backgroundColor = UIColor.clear
            self.filterView1.backgroundColor = UIColor.clear
            self.filterView1.addSubview(self.filterView)
            self.view.addSubview(self.blurView)
            self.blurView.addSubview(self.filterView1)

        }, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //cell.backgroundColor = UIColor.cyan
        let categoryView = cell.viewWithTag(1) as! ViewAnimation
        let timeLineView = cell.viewWithTag(2) as! ViewAnimation
        let statusLabel = cell.viewWithTag(3) as! UILabel
        let categoryImageView = cell.viewWithTag(4) as! UIImageView
        categoryImageView.image = UIImage(named: categoryImageArray[indexPath.row])
        if succesArray[indexPath.row] == 0 {
            // Success
            categoryView.backgroundColor = UIColor.green
            timeLineView.borderColor = UIColor.green
            statusLabel.text = "Success"
        } else if succesArray[indexPath.row] == 1 {
            // Failure
            categoryView.backgroundColor = UIColor.orange
            timeLineView.borderColor = UIColor.orange
            statusLabel.text = "Failure"
        } else if succesArray[indexPath.row] == 2 {
            // Inprogress
            categoryView.backgroundColor = UIColor.purple
            timeLineView.borderColor = UIColor.purple
            statusLabel.text = "Inprogress"
        } else if succesArray[indexPath.row] == 3 {
            // Cancelled
            categoryView.backgroundColor = UIColor.red
            timeLineView.borderColor = UIColor.red
            statusLabel.text = "Cancelled"
        }
        
        return cell
    }
}
