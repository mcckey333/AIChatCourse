//
//  AppViewBuilder.swift
//  AIChatCourse
//
//  Created by Intuin  on 30/4/2025.
//
import SwiftUI

struct AppViewBuilder<TabbarView: View, OnboardingView: View>: View {
    var showTabBar: Bool = true
    @ViewBuilder var tabbarView: TabbarView
    @ViewBuilder var onboardingView: OnboardingView
    var body: some View {
        ZStack {
            if showTabBar {
                TabBarView()
            } else {
                WelcomeView()
            }
        }
        .animation(.smooth, value: showTabBar)
    }
}

private struct Preview: View {
    @State var showTabBar: Bool = false
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

#Preview() {
    Preview()
}
