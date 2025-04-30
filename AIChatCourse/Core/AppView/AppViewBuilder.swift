//
//  AppViewBuilder.swift
//  AIChatCourse
//
//  Created by Intuin  on 30/4/2025.
//


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