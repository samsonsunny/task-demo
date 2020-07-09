//
//  TodayViewController.swift
//  Today Tasks
//
//  Created by Sam on 7/8/20.
//  Copyright © 2020 samson. All rights reserved.
//

import UIKit
import NotificationCenter
import TaskFramework

class TodayViewController: UIViewController, NCWidgetProviding, UITableViewDataSource, UITableViewDelegate {
    
	@IBOutlet weak var tableView: UITableView!
	
	var tasks: [Task] = [] {
		didSet {
			tableView.reloadData()
		}
	}
	
    override func viewDidLoad() {
		super.viewDidLoad()
		tableView.dataSource = self
		tableView.delegate = self
		
		tasks = TaskManager.savedTasks
		self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tasks.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
		cell?.textLabel?.text = tasks[indexPath.row].title
		return cell!
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let appURL = URL(string: "tasks://") {
			extensionContext?.open(appURL, completionHandler: nil)
		}
	}
	
	func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
		switch activeDisplayMode {
		case .compact:
			preferredContentSize = maxSize
		case .expanded:
			var height: CGFloat = 0
			for _ in 0 ..< tasks.count {
				height += 60
			}
			preferredContentSize = CGSize(width: maxSize.width, height: min(height, maxSize.height))
		@unknown default:
			preconditionFailure("Unexpected value for activeDisplayMode.")
		}
	}
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
		
		tasks = TaskManager.savedTasks
        
        completionHandler(NCUpdateResult.newData)
    }
}
