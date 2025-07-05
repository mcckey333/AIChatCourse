//
//  CreateAccountView.swift
//  AIChatCourse
//
//  Created by Intuin  on 22/5/2025.
//

import SwiftUI

struct CreateAccountView: View {
    
    @Environment(\.authService) private var authService
    @Environment(\.dismiss) private var dismiss

    var title: String = "Create Account?"
    var subtitle: String = "Don't lose your data, Conect to an SSO provider to save your account"
    var onDidSignIn: ((_ isNewUser: Bool) -> Void)?
    
    var body: some View {
        VStack(spacing: 24) {
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
                    onSignInApplePressed()
                }
            
            Spacer()
        }
        .padding(16)
        .padding(.top, 40) 
    }
    
    func onSignInApplePressed() {
        Task {
            do {
                let result = try await authService.signInApple()
                print("Did sign in with apple")
                onDidSignIn?(result.isNewUser)
                dismiss()
            }
            catch {
                print("Error signing in with Apple: \(error.localizedDescription)")
                print("Full error: \(error)")
            }
        }
    }
}

#Preview {
    CreateAccountView()
}
