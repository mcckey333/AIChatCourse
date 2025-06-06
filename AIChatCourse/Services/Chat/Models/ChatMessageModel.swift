//
//  ChatMessageModel.swift
//  AIChatCourse
//
//  Created by Intuin  on 19/5/2025.
//

import Foundation

struct ChatMessageModel: Identifiable {
    let id: String
    let chatId: String
    let authorId: String?
    let content: String?
    let seenByIds: [String]?
    let dateCreated: Date?
    
    init(
        id: String,
        chatId: String,
        authorId: String? = nil,
        content: String? = nil,
        seenByIds: [String]? = nil,
        dateCreated: Date? = nil
    ) {
        self.id = id
        self.chatId = chatId
        self.authorId = authorId
        self.content = content
        self.seenByIds = seenByIds
        self.dateCreated = dateCreated
    }
    
    func hasBeenSeenByCurrentUser(userId: String) -> Bool {
        guard let seenByIds else { return false }
        return seenByIds.contains(userId)
    }
    
    static var mock: ChatMessageModel {
        mocks[0]
    }
    
    static var mocks: [ChatMessageModel] {
        let now = Date()
        return [
            ChatMessageModel(
                id: "msg1",
                chatId: "chat1",
                authorId: "user1",
                content: "Hey, how's it going?",
                seenByIds: ["user2"],
                dateCreated: now
            ),
            ChatMessageModel(
                id: "msg2",
                chatId: "chat1",
                authorId: "user2",
                content: "All good! You?",
                seenByIds: ["user1"],
                dateCreated: now.addingTime(minutes: 2)
            ),
            ChatMessageModel(
                id: "msg3",
                chatId: "chat2",
                authorId: "user1",
                content: "Meeting is rescheduled to tomorrow.",
                seenByIds: ["user4", "user5"],
                dateCreated: now.addingTime(hours: -3)
            ),
            ChatMessageModel(
                id: "msg4",
                chatId: "chat3",
                authorId: "user2",
                content: "Sounds good. Let's do it.",
                seenByIds: nil,
                dateCreated: now.addingTime(days: -1, hours: -2)
            )
        ]
    }
}
