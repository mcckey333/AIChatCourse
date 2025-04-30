//
//  AppView.swift
//  AIChatCourse
//
//  Created by Intuin  on 28/4/2025.
//

import SwiftUI
// tabbar - signed in
// onboarding - signed out
struct AppView: View {
    @AppStorage("showTabbarView") var showTabBar: Bool = false
    var body: some View {
        AppViewBuilder(
            showTabBar: showTabBar,
            tabbarView: {
                ZStack {
                    Color.red.ignoresSafeArea()
                    Text("Tabbar")
                }
            },
            onboardingView: {
                WelcomeView()
            }
        )
        .onTapGesture {
            showTabBar.toggle()
        }
    }
}

#Preview("AppView - Tabbar") {
    AppView(showTabBar: false)
}
#Preview("AppView - Onboarding") {
    AppView(showTabBar: false)
}
