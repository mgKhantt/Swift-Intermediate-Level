//
//  TestFullNoti.swift
//  SwiftUi_Intermediate_Level
//
//  Created by Khant Phone Naing  on 19/07/2025.
//

import SwiftUI
import UserNotifications

class BageManager {
    
    static let shared = BageManager()
    
    func updateBadge(to value: Int) {
        UNUserNotificationCenter.current().setBadgeCount(value) { error in
            if let error = error {
                print("Error setting badge: \(error.localizedDescription)")
            } else {
                print("Badge set to \(value)")
            }
        }
    }
    
    func clearBadge() {
        updateBadge(to: 0)
    }
}

class NotiManager {
    static let shared = NotiManager()
    
    func showNoti() {
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("\(error.localizedDescription)")
            } else {
                print("success")
            }
        }
    }
    
    func createNoti() {
        let content = UNMutableNotificationContent()
        content.title = "Hello, World!"
        content.subtitle = "Hello, Subtitle!"
        
        //dynamic badge
        let currentBage = UserDefaults.standard.integer(forKey: "badgeCount")
        let newBadge = currentBage + 1
        content.badge = NSNumber(value: newBadge)
        UserDefaults.standard.set(newBadge, forKey: "badgeCount")
        UNUserNotificationCenter.current().setBadgeCount(newBadge)
        
        let timeTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let requestNoti = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: timeTrigger)
        
        UNUserNotificationCenter.current().add(requestNoti)
    }
    
    func disableNoti() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        print("Pending notifications cleared.")
    }
}

struct FullNoti: View {
    @AppStorage("notificationsEnabled") var notificationsEnabled: Bool = false
    
    @State var isShow: Bool = false
    
    var body: some View {
        Toggle("Notifications", isOn: $isShow)
            .padding()
            .onChange(of: isShow) { _, newValue in
                if newValue {
                    NotiManager.shared.showNoti()
                } else {
                    NotiManager.shared.disableNoti()
                }
            }
        Button("Send Notification") {
            NotiManager.shared.createNoti()
        }
    }
}

#Preview {
    FullNoti()
}
