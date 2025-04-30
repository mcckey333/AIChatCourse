//
//  ChatsView.swift
//  AIChatCourse
//
//  Created by Intuin  on 30/4/2025.
//

import SwiftUI

struct ChatsView: View {
    var body: some View {
        NavigationStack {
            Text("Chats")
                .navigationTitle("Chats")
        }
        .tabItem {
            Label("Chats", systemImage: "bubble.left.and.bubble.right")
        }
    }
}

#Preview {
    ChatsView()
}
