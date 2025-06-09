//
//  ChatsView.swift
//  AIChatCourse
//
//  Created by Intuin  on 30/4/2025.
//

import SwiftUI

struct ChatsView: View {
    
    @State private var chats: [ChatModel] = []
    @State private var path: [NavigationPathOption] = []
    @State private var recentAvatars: [AvatarModel] = AvatarModel.mocks
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                if !recentAvatars.isEmpty {
                    recentsSection
                }
                chatsSection
            }
            .navigationTitle("Chats")
            .navigationDestinationForCoreModule(path: $path)
        }
        .tabItem {
            Label("Chats", systemImage: "bubble.left.and.bubble.right")
        }
        
    }
    private func onChatPressed(chat: ChatModel) {
        path.append(.chat(avatarId: chat.avatarId))
    }
    
    private func onAvatarPressed(avatar: AvatarModel) {
        path.append(.chat(avatarId: avatar.avatarId))
    }
    private var chatsSection: some View {
        Section {
            if chats.isEmpty {
                Text("Your chats will appear here.")
                    .foregroundStyle(.secondary)
                    .font(.title3)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .padding(40)
                    .removeListRowFormatting()
            }
            else {
                ForEach(chats) { chat in
                    ChatRowCellViewBuilder(
                        currentUserId: nil, // FIXME: Add cuid
                        chat: chat,
                        getAvatar: {
                            try? await Task.sleep(for: .seconds(1))
                            return AvatarModel.mocks.randomElement()!
                        },
                        getLastChatMessage: {
                            try? await Task.sleep(for: .seconds(1))
                            return ChatMessageModel.mocks.randomElement()!
                        },
                    )
                    .anyButton(.highlight, action: {
                        onChatPressed(chat: chat)
                    })
                }
            }
        } header: {
            Text("Chat")
        }
    }
    
    private var recentsSection: some View {
        Section {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 8) {
                    ForEach(recentAvatars, id: \.self) { avatar in
                        if let imageName = avatar.profileImageName {
                            VStack(spacing: 8) {
                                ImageLoaderView(urlString: imageName)
                                    .aspectRatio(1, contentMode: .fit)
                                    .clipShape(Circle())
                                Text(avatar.name ?? "")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            .anyButton {
                                onAvatarPressed(avatar: avatar)
                            }
                            
                        }
                    }
                }
                .padding(.top, 12)
            }
            .frame(height: 120)
            .scrollIndicators(.hidden)
            .removeListRowFormatting()
        } header: {
            Text("Recents")
        }
    }
}

#Preview {
    ChatsView()
}
