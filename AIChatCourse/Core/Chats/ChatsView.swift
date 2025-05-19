//
//  ChatsView.swift
//  AIChatCourse
//
//  Created by Intuin  on 30/4/2025.
//

import SwiftUI

struct ChatsView: View {
    
    @State private var chats: [ChatModel] = ChatModel.mocks
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(chats) { chat in
                    Text(chat.id)
                }
            }
        }
        .tabItem {
            Label("Chats", systemImage: "bubble.left.and.bubble.right")
        }
    }
}

#Preview {
    ChatsView()
}
