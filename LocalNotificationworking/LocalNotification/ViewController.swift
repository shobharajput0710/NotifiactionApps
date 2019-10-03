//
//  ViewController.swift
//  LocalNotification
//
//  Created by KartRocket iOSOne on 27/09/19.
//  Copyright © 2019 CodesRoom. All rights reserved.
//

import UIKit
import UserNotifications


extension ViewController: UNUserNotificationCenterDelegate{
    internal func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification , withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions)-> Void) {
        
        completionHandler([.alert, .sound , .badge])
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        UNUserNotificationCenter.current().delegate = self
    }

    @IBAction func notifyAction(_ sender: Any) {
        createNotification()
        
    }
    
    func createNotification(){
        let content = UNMutableNotificationContent()
        content.title = "hello"
        content.subtitle = "You have a notification"
        content.body = "How are you?"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3.0, repeats: false)
        
        let request = UNNotificationRequest(identifier: "Identifier", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request){ (error) in
            print(error as Any)
            
        }
    }
}

