//
//  TabBarView.swift
//  AIChatCourse
//
//  Created by Intuin  on 30/4/2025.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
                TabView {
                    NavigationStack {
                        ExploreView()
                    }
                    .tabItem { Label("Explore", systemImage: "magnifyingglass") }

                    NavigationStack {
                        ChatsView()
                    }
                    .tabItem { Label("Chats", systemImage: "message") }

                    NavigationStack {
                        ProfileView()
                    }
                    .tabItem { Label("Profile", systemImage: "person") }
                }
            }
        }

#Preview {
    NavigationStack {
        TabBarView()
    }
}
