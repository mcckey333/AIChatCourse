//
//  AppView.swift
//  AIChatCourse
//
//  Created by Intuin  on 28/4/2025.
//

import SwiftUI

struct AppView: View {
    
    @State var appState: AppState
    var body: some View {
        VStack {
            Text("TabBar: \(appState.showTabBar.description)")
                .onAppear {
                    print("🔍 Initial showTabBar: \(appState.showTabBar)")
                }
                .onChange(of: appState.showTabBar) { newValue in
                    print("🔥 showTabBar changed to \(newValue)")
                }
        }
            
            AppViewBuilder(
                tabbarView: {
                    TabBarView()
                },
                onboardingView: {
                    WelcomeView()
                }
            )
        }
    }

#Preview("AppView - Tabbar") {
    AppView(appState: AppState(showTabBar: true))
}
#Preview("AppView - Onboarding") {
    AppView(appState: AppState(showTabBar: false))
}
