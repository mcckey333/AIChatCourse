//
//  CreateAccountView.swift
//  AIChatCourse
//
//  Created by Intuin  on 22/5/2025.
//

import SwiftUI

struct CreateAccountView: View {
    var title: String = "Create Account?"
    var subtitle: String = "Don't lose your data, Conect to an SSO provider to save your account"
    var body: some View {
        VStack(spacing: 24)  {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(subtitle)
                    .font(.body)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            SignInWithAppleButtonView(
                type: .signIn,
                style: .black, cornerRadius: 10)
                .frame(height: 55)
                .anyButton(.press) {
                    
                }
            
            Spacer()
        }
        .padding(16)
        .padding(.top, 40) 
    }
}

#Preview {
    CreateAccountView()
}
