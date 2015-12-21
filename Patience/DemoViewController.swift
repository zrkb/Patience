//
//  DemoViewController.swift
//  SingleActivityIndicator
//
//  Created by Felix Ayala on 12/18/15.
//  Copyright © 2015 Pandorga. All rights reserved.
//

import UIKit

class DemoViewController: UITableViewController {
	
	var numberOfRows = 0

    override func viewDidLoad() {
        super.viewDidLoad()
		
		Patience.show(self.tableView)
		self.tableView.tableFooterView = UIView() // Remove line separators
		self.tableView.scrollEnabled = false
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DemoCell", forIndexPath: indexPath)

		cell.textLabel?.text = String(format: "%i", indexPath.row)

        return cell
    }
	
}
