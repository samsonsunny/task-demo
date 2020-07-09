//
//  Task.swift
//  TaskFramework
//
//  Created by Sam on 7/8/20.
//  Copyright © 2020 samson. All rights reserved.
//

import Foundation

var userDefaults = UserDefaults(suiteName: "group.sam.app.task")
var taskKey = "tasks"

public struct Task: Codable {
	
	public var title: String
	public var priority: Priority
	public var dueDate: Date
	public var isCompleted: Bool
	
	public init(title: String, priority: Priority, completed: Bool) {
		self.title = title
		self.priority = priority
		self.dueDate = Date()
		self.isCompleted = completed
	}
}

public enum Priority: String, Codable {
	case low
	case medium
	case high
}

public class TaskManager: NSObject {
	
	public class func saveTask(_ task: Task) {
		
		var tasks = savedTasks
		tasks.append(task)
		
		let encoder = PropertyListEncoder()
		if let encoded = try? encoder.encode(tasks) {
			userDefaults?.set(encoded, forKey: taskKey)
		}
	}
	
	public class var savedTasks: [Task] {
		guard let taskData = userDefaults?.data(forKey: taskKey) else {
			return []
		}
		let decoder = PropertyListDecoder()
        do {
            return try decoder.decode([ Task ].self, from: taskData)
        } catch {
            fatalError(error.localizedDescription)
        }
	}
}
