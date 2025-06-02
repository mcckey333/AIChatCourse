//
//  ProfileModalView.swift
//  AIChatCourse
//
//  Created by Intuin  on 2/6/2025.
//

import SwiftUI

struct ProfileModalView: View {
    
    var imageName: String? = Constants.randomImage
    var title: String? = "Alpha"
    var subtitle: String? = "Alien"
    var headline: String? = "An alien in the park"
    var onXmarkPressed: () -> Void = {}
    
    var body: some View {
        VStack(spacing: 0) {
            if let imageName {
                ImageLoaderView(urlString: imageName, forceTransitionAnimation: true)
                    .aspectRatio(1, contentMode: .fit)
            }
            VStack(alignment: .leading, spacing: 4) {
                if let title {
                    Text(title)
                        .font(.title)
                        .fontWeight(.semibold)
                }
                if let subtitle {
                    Text(subtitle)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }
                if let headline {
                    Text(headline)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(24)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(.thinMaterial)
        .cornerRadius(16)
        .overlay(
            Image(systemName: "xmark.circle.fill")
                .font(.title)
                .foregroundStyle(Color.black)
                .padding(4)
                .anyButton {
                    onXmarkPressed()
                }
            , alignment: .topTrailing
                
        )
    }
}

#Preview("Modal with Image") {
    ZStack {
        ProfileModalView()
            .padding(40)
    }
}

#Preview("Modal without Image") {
    ZStack {
        ProfileModalView()
            .padding(40)
    }
}
