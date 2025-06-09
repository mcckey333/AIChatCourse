//
//  AIChatCourseApp.swift
//  AIChatCourse
//
//  Created by Intuin  on 24/4/2025.
//
import Firebase
import SwiftUI

@main
struct AIChatCourseApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @State private var appState = AppState()
    var body: some Scene {
        WindowGroup {
            AppView(appState: appState)
                .environment(appState)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
