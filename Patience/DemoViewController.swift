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

    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.tableView.tableFooterView = UIView() // Remove line separators
		self.tableView.isScrollEnabled = false
		
		Patience.show()
    }
	
	func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
		
	}

    // MARK: - Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoCell", for: indexPath as IndexPath)

		cell.textLabel?.text = String(format: "%i", indexPath.row)

        return cell
    }
	
}
