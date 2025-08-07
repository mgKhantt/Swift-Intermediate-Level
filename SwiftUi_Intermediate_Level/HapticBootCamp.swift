//
//  HapticBootCamp.swift
//  SwiftUi_Intermediate_Level
//
//  Created by Khant Phone Naing  on 19/07/2025.
//

import SwiftUI
import CoreHaptics

class HapticManager {
    static let shareHaptics = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct HapticBootCamp: View {
    
    var body: some View {
        Button("success") {
            HapticManager.shareHaptics.notification(type: .success)
        }
    }
}

#Preview {
    HapticBootCamp()
}
