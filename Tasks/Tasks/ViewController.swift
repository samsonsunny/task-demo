//
//  ViewController.swift
//  Tasks
//
//  Created by Sam on 7/8/20.
//  Copyright © 2020 samson. All rights reserved.
//

import UIKit
import TaskFramework

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	var tasks: [Task] = [] {
		didSet {
			tableView.reloadData()
		}
	}

	@IBOutlet weak var tableView: UITableView!
	
	@IBAction func addTask(_ sender: Any) {
		let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "AddTaskViewControllerID")
		self.present(vc, animated: true, completion: nil)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.dataSource = self
		tableView.delegate = self
		tasks = TaskManager.savedTasks
		NotificationCenter.default.addObserver(self, selector: #selector(reloadTasks), name: NSNotification.Name("task"), object: nil)
	}
	
	@objc func reloadTasks() {
		tasks = TaskManager.savedTasks
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tasks.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TaskCell
		
		cell?.taskLabel.text = tasks[indexPath.row].title
		
		return cell!
	}
}

class TaskCell: UITableViewCell {
	@IBOutlet weak var taskLabel: UILabel!
}


class AddTaskViewController: UIViewController {
	
	@IBOutlet weak var task: UITextField!
	
	@IBAction func addTask(_ sender: Any) {
		
		let t = Task(title: task.text!, priority: .high, completed: true)
		
		TaskManager.saveTask(t)
		
		NotificationCenter.default.post(name: NSNotification.Name("task"), object: nil)
		
		self.dismiss(animated: true, completion: nil)
	}
}
