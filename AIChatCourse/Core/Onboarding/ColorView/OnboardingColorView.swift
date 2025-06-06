//
//  OnboardingColorView.swift
//  AIChatCourse
//
//  Created by Intuin  on 8/5/2025.
//

import SwiftUI

struct OnboardingColorView: View {
    let profileColors: [Color] = [.red, .green, .orange, .blue, .mint, .purple, .cyan, .teal, .indigo]
    @State private var selectedColor: Color?
   
    var body: some View {
        ScrollView {
            colorGrid
            .padding(24)
        }
        .safeAreaInset(edge: .bottom, alignment: .center, spacing: 16, content: {
            ZStack {
                if let selectedColor {
                    ctaButton(selectedColor: selectedColor)
                    .transition(AnyTransition.move(edge: .bottom))
                }
                
            }
            .padding(24)
            .background(Color(uiColor: .systemBackground))
            //            .background(Color.black)
        })
        .animation(.bouncy, value: selectedColor)
        .toolbar(.hidden, for: .navigationBar)
    }
    private var colorGrid: some View {
        LazyVGrid(
            columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3),
            alignment: .center,
            spacing: 16,
            pinnedViews: [.sectionHeaders],
            content: {
                Section(content: {
                    ForEach(profileColors, id: \.self) { color in
                        Circle()
                            .fill(.accent)
                            .overlay(
                                color
                                    .clipShape(Circle())
                                    .padding(selectedColor == color ? 10: 0)
                            )
                        
                            .onTapGesture {
                                selectedColor = color
                            }
                    }
                    
                }, header: {
                    Text("Select a profile color")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                }
                )
            }
        )
    }
    private func ctaButton(selectedColor: Color) -> some View {
        NavigationLink {
            OnboardingCompletedView(selectedColor: selectedColor)
        } label: {
            Text("Continue")
                .callToActionButton()
        }
    }
}

#Preview {
    NavigationStack {
        OnboardingColorView()
            .environment(AppState())
    }
}
