//
//  DemoViewController.swift
//  SingleActivityIndicator
//
//  Created by Felix Ayala on 12/18/15.
//  Copyright © 2016 Pandorga. All rights reserved.
//

import UIKit

class DemoViewController: UITableViewController {
	
	var numberOfRows = 0
	var spinnerView = Spinner()

    override func viewDidLoad() {
        super.viewDidLoad()
		
//		self.tableView.tableFooterView = UIView() // Remove line separators
//		self.tableView.isScrollEnabled = false
//
//		self.tableView.addSubview(spinnerView)
//		spinnerView.frame = CGRect(x: (375.0 - 50.0) / 2.0, y: self.tableView.center.y, width: 35, height: 35)
//
//		spinnerView.circleLayer.lineWidth = 4.0
//		spinnerView.circleLayer.strokeColor = UIColor.orange.cgColor
//		spinnerView.beginRefreshing()
		
		Patience.show()
		
		// MARK: - Table view data source
		func numberOfSectionsInTableView(tableView: UITableView) -> Int {
			return 1
		}
		
		func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
			return numberOfRows
		}
		
		func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
			let cell = tableView.dequeueReusableCell(withIdentifier: "DemoCell", for: indexPath as IndexPath)
			
			cell.textLabel?.text = String(format: "%i", indexPath.row)
			
			return cell
		}
		
		Patience.show()
    }
	
}
