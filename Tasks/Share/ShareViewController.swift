//
//  ShareViewController.swift
//  Share
//
//  Created by Sam on 7/10/20.
//  Copyright © 2020 samson. All rights reserved.
//

import UIKit
import Social
import TaskFramework

class ShareViewController: SLComposeServiceViewController {

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
		
		guard self.textView.text.count > 0 else {
			return false
		}
		
        return true
    }

    override func didSelectPost() {
		
		let link = Task(title: self.textView.text!, priority: .high, completed: true)
		
		LinkManager.saveLink(link)
		
		
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

}
