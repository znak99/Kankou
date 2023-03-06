//
//  PasswordResetView.swift
//  Kankou
//
//  Created by seungwoo on 2023/03/06.
//

import SwiftUI

struct PasswordResetView: View {
    @State private var userEmail: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.customWhite.ignoresSafeArea()
            
            NavigationViewBackButtonComponent(dismiss: dismiss)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    AuthenticationLogoComponent()
                    VStack(spacing: 18) {
                        Text("会員登録の際入力した\nメールアドレスを入力してください")
                            .font(.custom(Font.customMedium, size: UIScreen.screenWidth / 32))
                            .foregroundColor(.customStateRed)
                            .multilineTextAlignment(.center)
                        
                        TextField("メールアドレス", text: $userEmail)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color.customTrueWhite)
                            .cornerRadius(8)
                            .shadow(color: Color.customPrimary, radius: 2)
                            .foregroundColor(.customBlack)
                            .font(.custom(Font.customMedium, size: UIScreen.screenWidth / 24))
                            .textInputAutocapitalization(.never)
                            .keyboardType(.emailAddress)
                            .textContentType(.emailAddress)
                        
                        Button(action: { login() }) {
                            HStack {
                                Spacer()
                                Text("メールを送る")
                                    .font(.custom(Font.customExtraBold, size: UIScreen.screenWidth / 24))
                                    .foregroundColor(.customWhite)
                                Spacer()
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color.customPrimary)
                            .cornerRadius(8)
                            .shadow(color: Color.customPrimary, radius: 2)
                        }
                        .padding(.top)
                    }
                    .padding(.vertical)
                    .padding(.horizontal, UIScreen.screenWidth / 10)
                }
            }
            .padding(.top)
            .navigationBarBackButtonHidden()
            .toolbar(.hidden)
        }
    }
    
    private func login() {
        dismiss()
    }
}

struct PasswordResetView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordResetView()
    }
}
