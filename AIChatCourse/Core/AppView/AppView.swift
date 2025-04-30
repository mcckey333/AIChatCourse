//
//  AppView.swift
//  AIChatCourse
//
//  Created by Intuin  on 28/4/2025.
//

import SwiftUI
// tabbar - signed in
// onboarding - signed out

struct AppViewBuilder<TabbarView: View, OnboardingView: View>: View {
    var showTabBar: Bool = false
    @ViewBuilder var tabbarView: TabbarView
    @ViewBuilder var onboardingView: OnboardingView
    var body: some View {
        ZStack {
            if showTabBar {
                ZStack {
                    Color.red.ignoresSafeArea()
                    Text("Tabbar")
                }
                .transition(.move(edge: .trailing))
            } else {
                ZStack {
                    Color.blue.ignoresSafeArea()
                    Text("Onboarding")
                }
            }
        }
        .animation(.smooth, value: showTabBar)
    }
}
struct AppView: View {
    @State private var showTabBar: Bool = false
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
                ZStack {
                    Color.blue.ignoresSafeArea()
                    Text("Onboarding")
                }
            }
            
        )
        .onTapGesture {
            showTabBar.toggle()
        }
    }
}

#Preview {
    AppView()
}
