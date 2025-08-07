//
//  SwiftUi_Intermediate_LevelApp.swift
//  SwiftUi_Intermediate_Level
//
//  Created by Khant Phone Naing  on 11/07/2025.
//

import SwiftUI
import UserNotifications

@main
struct SwiftUi_Intermediate_LevelApp: App {
    
//    init() {
//        UNUserNotificationCenter.current().delegate = NotificationDelegate.shared
//    }
    
    var body: some Scene {
        WindowGroup {
            CoreDataBootCamp()
        }
    }
}

//class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
//    static let shared = NotificationDelegate()
//
//    // Show notification even when app is in foreground
//    func userNotificationCenter(_ center: UNUserNotificationCenter,
//                                 willPresent notification: UNNotification,
//                                 withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//        completionHandler([.banner, .sound, .badge]) // or .alert for older styles
//    }
//}

