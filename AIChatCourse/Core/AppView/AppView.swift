//
//  AppView.swift
//  AIChatCourse
//
//  Created by Intuin  on 28/4/2025.
//

import SwiftUI
struct AppView: View {
    
    @Environment(\.authService) private var authService
    @State var appState: AppState = AppState()
    
    var body: some View {
        print("App view body is running")
            return AppViewBuilder(
                tabbarView: {
                    TabBarView()
                },
                onboardingView: {
                    WelcomeView()
                }
            )
            .environment(appState)
            .task {
                print("Starting check") 
                await checkUserStatus()
            }
        }
    private func checkUserStatus() async {
        if let user = authService.getAuthenticatedUser() {
            // User is authenticated
            print("User already authenticated: \(user.uid)")
        } else {
            // User is not authenticated
            do {
                let result = try await authService.signInAnonymously()
                print("Sign In Anonymous success: \(result.user.uid)")
            }
            catch {
                print(error)
            }
        }
    }
    }

#Preview("AppView - Tabbar") {
    AppView(appState: AppState(showTabBar: true))
}
#Preview("AppView - Onboarding") {
    AppView(appState: AppState(showTabBar: false))
}
