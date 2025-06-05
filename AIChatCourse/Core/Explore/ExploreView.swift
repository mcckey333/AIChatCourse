//
//  ExploreView.swift
//  AIChatCourse
//
//  Created by Intuin  on 30/4/2025.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var featuredAvatars: [AvatarModel] = AvatarModel.mocks
    @State private var categories: [CharacterOption] = CharacterOption.allCases
    @State private var popularAvatars: [AvatarModel] = AvatarModel.mocks
    @State private var path: [NavigationPathOption] = []

    var body: some View {
        NavigationStack(path: $path) {
            List {
                featuredSection
                categorySection
                popularSection
            }
            .navigationTitle("Explore")
            .navigationDestinationForCoreModule(path: $path)
        }
        .tabItem {
            Label("Explore", systemImage: "eyes")
        }
        }
    
    private var featuredSection: some View {
        Section(header: Text("Featured")) {
            CarouselView(items: featuredAvatars) { avatar in
                HeroCellView(title: avatar.name, subtitle: avatar.characterDescription, imageName: avatar.profileImageName
                )
                .anyButton {
                    onAvatarPressed(avatar: avatar)
                }
            }
        }
        .removeListRowFormatting()
    }
    
    private func onAvatarPressed(avatar: AvatarModel) {
        path.append(.chat(avatarId: avatar.avatarId))
      
    }
    
    private func onCategoryPressed(category: CharacterOption, imageName: String) {
        path.append(.category(category: category, imageName: imageName))
    }
    
    private var categorySection: some View {
        Section(header: Text("Categories")) {
            ZStack {
                ScrollView(.horizontal) {
                    HStack(spacing: 12) {
                        ForEach(categories, id: \.self) { category in
                            let imageName = popularAvatars.first(where: { $0.characterOption == category })?.profileImageName
                            if let imageName {
                                CategoryCellView(title: category.rawValue.capitalized, imageName: imageName)
                                    .anyButton {
                                        onCategoryPressed(category: category, imageName: imageName)
                                    }
                            }
                        }
                    }
                }
            }
            .frame(height: 140)
            .scrollIndicators(.hidden)
            .scrollTargetLayout()
            .scrollTargetBehavior(.viewAligned)
            
        }
        .removeListRowFormatting()
        
    }
    private var popularSection: some View {
        Section(header: Text("Popular")) {
            ForEach(popularAvatars, id: \.self) { avatar in
                CustomListCellView(
                    imageName: avatar.profileImageName ?? "Alpha",
                    title: avatar.name,
                    subtitle: avatar.characterDescription
                )
                .anyButton(.highlight) {
                    onAvatarPressed(avatar: avatar)
                }
                .removeListRowFormatting()
            }
           
        }
    }
    }
#Preview {
    ExploreView()
}
