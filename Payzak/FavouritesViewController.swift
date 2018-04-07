//
//  FavouritesViewController.swift
//  Payzak
//
//  Created by Lalithbabu Logeshwarrao on 18/07/2017.
//  Copyright © 2017 Payzak Financial Service. All rights reserved.
//

import UIKit

class FavouritesViewController: UIViewController, HalfModalPresentable, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var favouriteTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        favouriteTable.delegate = self
        favouriteTable.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func CloseButtonAction(_ sender: Any) {
        if let delegate = navigationController?.transitioningDelegate as? HalfModalTransitioningDelegate {
            delegate.interactiveDismiss = false
        }
        dismiss(animated: true, completion: nil)
    }

    @IBAction func FullButtonAction(_ sender: Any) {
        maximizeToFullScreen()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FavouritesTableViewCell
        
        return cell
    }
}
