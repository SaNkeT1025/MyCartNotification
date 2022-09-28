//
//  OrderNotification.swift
//  
//
//  Created by Capgemini-DA067 on 9/26/22.
//

import Foundation
import UserNotifications
import UIKit

public class OrderNotification :NSObject, UNUserNotificationCenterDelegate, UIApplicationDelegate  {
    
    let notificationCentre = UNUserNotificationCenter.current()
    
    public override init() {}
    
    public func myLocalNotification() {
        UIApplication.shared.applicationIconBadgeNumber = 0
        notificationCentre.delegate = self
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Order Placed successful"
        notificationContent.body = "Thank you for ordering from MyKart"
        notificationContent.badge = NSNumber(value: 1)
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 8, repeats: false)
        let request = UNNotificationRequest(identifier: "testNotification", content: notificationContent, trigger: trigger)
        
        notificationCentre.add(request) { (error) in
            if let error = error{
                print("Nottification Error:" , error)
            }
        }
    }
}
