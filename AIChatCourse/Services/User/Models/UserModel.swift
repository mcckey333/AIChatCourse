//
//  UserModel.swift
//  AIChatCourse
//
//  Created by Intuin  on 20/5/2025.
//
import Foundation
import SwiftUI

struct UserModel {
    
    let userId: String
    let dateCreated: Date?
    let didCompleteOnboarding: Bool?
    let profileColorHex: String?
    
    init(
        userId: String,
        dateCreated: Date? = nil,
        didCompleteOnboarding: Bool? = nil,
        profileColorHex: String? = nil
    ) {
        self.userId = userId
        self.dateCreated = dateCreated
        self.didCompleteOnboarding = didCompleteOnboarding
        self.profileColorHex = profileColorHex
    }
    
    var profileColorCalculated: Color {
        guard let profileColorHex else {
            return .accent
        }
        return Color(hex: profileColorHex) ?? .accent
    }
    
    static var mock: Self {
        mocks[0]
    }
    static var mocks: [Self] {
        let now = Date()
        return [
            UserModel(
                userId: "user1",
                dateCreated: now.addingTime(days: -1, hours: -2), // 1 day 2 hours ago
                didCompleteOnboarding: true,
                profileColorHex: "#FFC0CB"
            ),
            UserModel(
                userId: "user2",
                dateCreated: now.addingTime(hours: -6), // 6 hours ago
                didCompleteOnboarding: false,
                profileColorHex: "#87CEEB"
            ),
            UserModel(
                userId: "user1",
                dateCreated: now.addingTime(days: -3, minutes: -15), // 3 days 15 minutes ago
                didCompleteOnboarding: true,
                profileColorHex: "#98FB98"
            ),
            UserModel(
                userId: "user2",
                dateCreated: nil,
                didCompleteOnboarding: nil,
                profileColorHex: nil
            )
        ]
    }
}
