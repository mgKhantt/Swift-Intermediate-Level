//
//  PushNotificationBootCamp.swift
//  SwiftUi_Intermediate_Level
//
//  Created by Khant Phone Naing  on 19/07/2025.
//

import SwiftUI
import UserNotifications

class NotificationManager {
    static let shared = NotificationManager()
    
    func requestAuthorization() {
        
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("\(error.localizedDescription)")
            } else {
                print("Success")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "This is my first noti"
        content.subtitle = "This is my first sub"
        content.sound = .default
        content.badge = 1
        
//        var dateComponents = DateComponents()
//        dateComponents.hour = 19
//        dateComponents.minute = 30
//        dateComponents.weekday = 2
//        let calenderTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}

struct PushNotificationBootCamp: View {
    
    @State var isOn: Bool = false
    
    var body: some View {
        Toggle("Notifications", isOn: $isOn)
            .padding()
            .onChange(of: isOn) { oldValue, newValue in
                if newValue {
                    NotificationManager.shared.requestAuthorization()
                }
            }
        Button("Send noti") {
            NotificationManager.shared.scheduleNotification()
        }
        .onAppear {
            UNUserNotificationCenter.current().setBadgeCount(0)
        }
    }
}

#Preview {
    PushNotificationBootCamp()
}
