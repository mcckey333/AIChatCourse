//
//  Untitled.swift
//  AIChatCourse
//
//  Created by Intuin  on 23/5/2025.
//
import Foundation

struct TextValidationHelper {
    static func checkIfTextIsValid(text: String) throws {
        
        guard text.count >= 3 else {
            throw TextValidationError.notEnoughCharacters
        }
        
        let badWords: [String] = [
            "shit", "bitch", "ass"
        ]
        if badWords.contains(text.lowercased()) {
            throw TextValidationError.hasBadWords
        }
    }
    
    enum TextValidationError: LocalizedError {
        case notEnoughCharacters
        case hasBadWords
        
        var errorDescription: String? {
            switch self {
            case .notEnoughCharacters:
                return "Please add atleast 3 characters "
            case .hasBadWords:
                return "Bad word detected. Please rephrase your message"
            }
        }
    }
}
