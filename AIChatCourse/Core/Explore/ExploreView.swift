//
//  ExploreView.swift
//  AIChatCourse
//
//  Created by Intuin  on 30/4/2025.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
                Text("Explore")
            .navigationTitle("Explore")
        }
        .tabItem {
            Label("Explore", systemImage: "eyes")
        }
    }
}

#Preview {
    ExploreView()
}
