//
//  LoginView.swift
//  Kankou
//
//  Created by seungwoo on 2023/03/06.
//

import SwiftUI

struct LoginView: View {
    
    @State private var userEmail: String = ""
    @State private var userPassword: String = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.customWhite.ignoresSafeArea()
            
            NavigationViewBackButtonComponent(dismiss: dismiss)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    AuthenticationLogoComponent()
                    VStack(spacing: 18) {
                        TextField("メールアドレス", text: $userEmail)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color.customTrueWhite)
                            .cornerRadius(8)
                            .shadow(color: Color.customPrimary, radius: 2)
                            .foregroundColor(.customBlack)
                            .font(.custom(Font.customMedium, size: UIScreen.screenWidth / 24))
                        SecureField("パスワード", text: $userPassword)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color.customTrueWhite)
                            .cornerRadius(8)
                            .shadow(color: Color.customPrimary, radius: 2)
                            .foregroundColor(.customBlack)
                            .font(.custom(Font.customMedium, size: UIScreen.screenWidth / 24))
                        Button(action: { login() }) {
                            HStack {
                                Spacer()
                                Text("ログイン")
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
                    
                    VStack(spacing: 18) {
                        NavigationLink {
                            RegisterView()
                        } label: {
                            Text("会員登録")
                                .font(.custom(Font.customRegular, size: UIScreen.screenWidth / 30))
                                .foregroundColor(.customAccentBlue)
                                .underline()
                        }
                        
                        NavigationLink {
                            PasswordResetView()
                        } label: {
                            Text("パスワードを忘れた場合")
                                .font(.custom(Font.customRegular, size: UIScreen.screenWidth / 30))
                                .foregroundColor(.customAccentBlue)
                                .underline()
                        }
                    }
                    .padding(.top, UIScreen.screenWidth / 5)
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
    
    private func login() {
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
