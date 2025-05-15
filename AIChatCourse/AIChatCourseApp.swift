//
//  AIChatCourseApp.swift
//  AIChatCourse
//
//  Created by Intuin  on 24/4/2025.
//

import SwiftUI

@main
struct AIChatCourseApp: App {
    @State private var appState = AppState()
    var body: some Scene {
        WindowGroup {
            AppView(appState: appState)
                .environment(appState)
        }
    }
}
