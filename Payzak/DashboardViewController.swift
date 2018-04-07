//
//  DashboardViewController.swift
//  Payzak
//
//  Created by Lalithbabu Logeshwarrao on 11/07/2017.
//  Copyright © 2017 Payzak Financial Service. All rights reserved.
//

import UIKit
import Charts

class DashboardViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
    var halfModalTransitioningDelegate: HalfModalTransitioningDelegate?
    @IBOutlet weak var favouriteButton: UIBarButtonItem!
    @IBOutlet weak var pieChart: PieChartView!

    //@IBOutlet weak var pieChart: PieChartView!
    var category: [String] = []
    var categoryValue: [Double] = []


    let succesArray = [2, 0, 1, 3, 2, 0, 1, 1, 0, 2]
    let categoryImageArray = ["groceries.png", "liquid.png", "mail.png", "coffee.png", "liquid.png", "mail.png", "groceries.png", "coffee.png", "liquid.png", "mail.png"]

    @IBOutlet weak var recentActivityTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        category = ["Bar", "Saloon", "Parlour", "Party", "Friends", "Education", "Others"]
        categoryValue = [10.0, 16.0, 9.0, 17.0, 11.0, 24.0, 13.0]
        
       // pieChart.delegate = self
        
        let empty: [String] = []
        setChart(dataPoints: category, values: categoryValue)
        
        recentActivityTable.delegate = self
        recentActivityTable.dataSource = self
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        self.halfModalTransitioningDelegate = HalfModalTransitioningDelegate(viewController: self, presentingViewController: segue.destination)
        segue.destination.modalPresentationStyle = .custom
        segue.destination.transitioningDelegate = self.halfModalTransitioningDelegate
    }

    func setChart(dataPoints: [String], values: [Double]) {
        if dataPoints.count == 0 {
            // No Data
            pieChart.noDataText = "No Chart Data is provided"
            pieChart.noDataFont = UIFont(name: "Avenir Next", size: 16)
        } else {
            
            var dataEntries: [PieChartDataEntry] = []
            
            for i in 0..<dataPoints.count {
                let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i])
                
                dataEntries.append(dataEntry)
            }
            
            let chartDataSet = PieChartDataSet(values: dataEntries, label: "")
            
            var colors: [UIColor] = []
            
            for i in 0..<dataPoints.count {
                let red = Double(arc4random_uniform(256))
                let green = Double(arc4random_uniform(256))
                let blue = Double(arc4random_uniform(256))
                
                let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 0.75)
                colors.append(color)
            }
            chartDataSet.colors = colors
            let chartData = PieChartData(dataSet: chartDataSet)
            pieChart.data = chartData
            pieChart.chartDescription?.text = ""
            pieChart.centerText = "Category Payment"
            pieChart.animate(xAxisDuration: 5.0, yAxisDuration: 5.0, easingOption: .easeInOutElastic)
 
        }
    }
    @IBAction func FavouriteButtonAction(_ sender: Any) {
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecentActivityTableViewCell
        
    
        cell.categoryImage.image = UIImage(named: categoryImageArray[indexPath.row])
        if succesArray[indexPath.row] == 0 {
            // Success
            cell.categoryView.backgroundColor = UIColor.green
            cell.lineView.borderColor = UIColor.green
            cell.statusLabel.text = "Success"
        } else if succesArray[indexPath.row] == 1 {
            // Failure
            cell.categoryView.backgroundColor = UIColor.orange
            cell.lineView.borderColor = UIColor.orange
            cell.statusLabel.text = "Failure"
        } else if succesArray[indexPath.row] == 2 {
            // Inprogress
            cell.categoryView.backgroundColor = UIColor.purple
            cell.lineView.borderColor = UIColor.purple
            cell.statusLabel.text = "Inprogress"
        } else if succesArray[indexPath.row] == 3 {
            // Cancelled
            cell.categoryView.backgroundColor = UIColor.red
            cell.lineView.borderColor = UIColor.red
            cell.statusLabel.text = "Cancelled"
        }
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
