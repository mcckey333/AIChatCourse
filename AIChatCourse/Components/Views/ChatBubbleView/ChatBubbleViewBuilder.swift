//
//  ChatBubbleViewBuilder.swift
//  AIChatCourse
//
//  Created by Intuin  on 22/5/2025.
//

import SwiftUI

struct ChatBubbleViewBuilder: View {
    var message: ChatMessageModel = .mock
    var isCurrentUser: Bool = false
    var imageName: String?
    var onImagePressed: (() -> Void)?
    
    var body: some View {
            ChatBubbleView(
                text: message.content ?? "",
                textColor: isCurrentUser ? .white : .primary,
                backgroundColor: isCurrentUser ? .accent : Color(uiColor: .systemGray6),
                imageName: imageName,
                showImage: !isCurrentUser,
                onImagePressed: onImagePressed
            )
            .frame(maxWidth: .infinity, alignment: isCurrentUser ? .trailing : .leading)
            .padding(.leading, isCurrentUser ? 75: 0)
            .padding(.trailing, isCurrentUser ? 0: 75)
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 24) {
            ChatBubbleViewBuilder()
            ChatBubbleViewBuilder(isCurrentUser: true)
            ChatBubbleViewBuilder(
                message: ChatMessageModel(
                    id: UUID().uuidString,
                    chatId: UUID().uuidString,
                    authorId: UUID().uuidString,
                    content: "This is some longer content that goes on to multiple lines and keeps on going to another line",
                    seenByIds: nil,
                    dateCreated: .now
                )
            )
        }
    }
    .padding(12)
}
