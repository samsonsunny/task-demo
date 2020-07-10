//
//  SceneDelegate.swift
//  Tasks
//
//  Created by Sam on 7/8/20.
//  Copyright © 2020 samson. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?


	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		// Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
		// If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
		// This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
		guard let _ = (scene as? UIWindowScene) else { return }
	}

	func sceneDidDisconnect(_ scene: UIScene) {
		// Called as the scene is being released by the system.
		// This occurs shortly after the scene enters the background, or when its session is discarded.
		// Release any resources associated with this scene that can be re-created the next time the scene connects.
		// The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
	}

	func sceneDidBecomeActive(_ scene: UIScene) {
		// Called when the scene has moved from an inactive state to an active state.
		// Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
	}

	func sceneWillResignActive(_ scene: UIScene) {
		// Called when the scene will move from an active state to an inactive state.
		// This may occur due to temporary interruptions (ex. an incoming phone call).
	}

	func sceneWillEnterForeground(_ scene: UIScene) {
		// Called as the scene transitions from the background to the foreground.
		// Use this method to undo the changes made on entering the background.
	}

	func sceneDidEnterBackground(_ scene: UIScene) {
		// Called as the scene transitions from the foreground to the background.
		// Use this method to save data, release shared resources, and store enough scene-specific state information
		// to restore the scene back to its current state.
		
		
		// Step 1
		let content = UNMutableNotificationContent()
		content.title = NSString.localizedUserNotificationString(forKey: "Hi!", arguments: nil)
		content.body = NSString.localizedUserNotificationString(forKey: "You entered background", arguments: nil)
		content.sound = UNNotificationSound.default
		content.badge = 1
		
		// Step 2
		let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
		
//		var date = DateComponents()
//		date.hour = 22
//		date.minute = 11
//		let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
		
		// Step 3
		let request = UNNotificationRequest(identifier: "first-id", content: content, trigger: trigger) // Schedule the notification.
		
		// Step 4
		
		let center = UNUserNotificationCenter.current()
		center.add(request) { (error : Error?) in
			 if let theError = error {
				 // Handle any errors
			 }
		}
		
	}
}

/*

let center = UNUserNotificationCenter.current()
		center.getNotificationSettings { settings in
			guard (settings.authorizationStatus == .authorized) ||
				  (settings.authorizationStatus == .provisional) else { return }

			if settings.alertSetting == .enabled {
				// Schedule an alert-only notification.
			} else {
				// Schedule a notification with a badge and sound.
			}
			
			
		}
		
		// Configure the notification's payload.
		let content = UNMutableNotificationContent()
		content.title = NSString.localizedUserNotificationString(forKey: "Hello!", arguments: nil)
		content.body = NSString.localizedUserNotificationString(forKey: "Hello_message_body", arguments: nil)
		content.sound = UNNotificationSound.default
		content.badge = 3
		 
		// Deliver the notification in five seconds.
		let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
		let request = UNNotificationRequest(identifier: "FiveSecond", content: content, trigger: trigger) // Schedule the notification.
//		let center = UNUserNotificationCenter.current()
		center.add(request) { (error : Error?) in
			 if let theError = error {
				 // Handle any errors
			 }
		}
		
		var date = DateComponents()
		date.hour = 21
		date.minute = 0
		// Configure the notification's payload.
		let content2 = UNMutableNotificationContent()
		content2.title = NSString.localizedUserNotificationString(forKey: "Hey!", arguments: nil)
		content2.body = NSString.localizedUserNotificationString(forKey: "Go for dinner", arguments: nil)
		content2.sound = UNNotificationSound.default
		content2.badge = 0
		 
		let trigger2 = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
		let request2 = UNNotificationRequest(identifier: "alarm", content: content2, trigger: trigger2)
		center.add(request2) { (err) in
			
		}
		
*/
