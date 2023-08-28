//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Jonas Cerqueira da Silva Junior on 16/04/23.
//

import SwiftUI
import UserNotifications

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    let center = UNUserNotificationCenter.current()
    
    init() {
        center.requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { (granted, error) in
            if let error: Error {
                print(error)
            }
        })
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
#if !os(watchOS)
        .commands {
            LandmarkCommands()
        }
#endif
#if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
#endif
#if os(macOS)
        Settings {
            LandmarkSettings()
        }
#endif
        
    }
}
