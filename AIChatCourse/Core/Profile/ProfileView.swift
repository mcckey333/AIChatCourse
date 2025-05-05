//
//  ProfileView.swift
//  AIChatCourse
//
//  Created by Intuin  on 30/4/2025.
//

import SwiftUI

struct ProfileView: View {
    @State private var showSettingsView: Bool = false
    var body: some View {
        NavigationStack {
            Text("Profile")
                .navigationTitle("Profile")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        settingsButton
                    }
                }
        }
        .sheet(isPresented: $showSettingsView) {
            SettingsView()
        }
        .tabItem {
            Label("Profile", systemImage: "person.fill")
        }
    }
    private var settingsButton: some View {
        Button {
            showSettingsView = true
        } label: {
            Image(systemName: "gear")
                .font(.headline)
        }
    }
    private func onSettingsButtonPressed() {
        showSettingsView = true
    }
}

#Preview {
    ProfileView()
}
