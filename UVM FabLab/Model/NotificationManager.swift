//
//  NotificationManager.swift
//  UVM FabLab
//
//  Created by Sam Clark on 4/25/19.
//  Copyright © 2019 UVM. All rights reserved.
//

import Foundation
import CoreLocation
import UserNotifications

class NotificationManager: NSObject, CLLocationManagerDelegate {
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    var count = 0
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("location updated \(count)")
        count += 1
        if (count == 20) {
            print("try notification")
            self.testNotification()
        }
    }
    
    func requestAuthorization() {
        notificationCenter.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            if !granted {
                self.requestAuthorization()
            }
        }
    }
    
    func testNotification() {
        let content = UNMutableNotificationContent()
        content.title = "some notification"
        content.body = "notification test"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10,
                                                        repeats: false)
        
        let identifier = "UYLLocalNotification"
        let request = UNNotificationRequest(identifier: identifier,
                                            content: content, trigger: trigger)
        notificationCenter.add(request, withCompletionHandler: { (error) in
            print("test")
            if let error = error {
                print(error)
            }
        })
    }
}
