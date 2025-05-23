//
//  ChatBubbleView.swift
//  AIChatCourse
//
//  Created by Intuin  on 22/5/2025.
//

import SwiftUI

struct ChatBubbleView: View {
    
    var text: String = "This is a sample text."
    var textColor: Color = .primary
    var backgroundColor: Color = Color(uiColor: .systemGray6)
    var imageName: String?
    let offset: CGFloat = 14
    var showImage: Bool = true
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            if showImage {
                ZStack {
                    if let imageName {
                        ImageLoaderView(urlString: imageName)
                    } else {
                        Rectangle()
                            .fill(.secondary)
                    }
                }
                .frame(width: 45, height: 45)
                .clipShape(Circle())
                .offset(y: offset)
            }
            Text(text)
                .font(.body)
                .foregroundStyle(textColor)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(backgroundColor)
                .cornerRadius(6)
        }
        .padding(.bottom, showImage ? offset : 0)
        
    }
}
#Preview {
    ScrollView {
        VStack(spacing: 16) {
            ChatBubbleView()
            ChatBubbleView()
            ChatBubbleView()
            ChatBubbleView(
                textColor: .white,
                backgroundColor: .accent,
                imageName: nil
            )
        }
        .padding(8)
    }
}
