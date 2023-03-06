//
//  RegisterView.swift
//  Kankou
//
//  Created by seungwoo on 2023/03/06.
//

import SwiftUI

struct RegisterView: View {
    
    @State private var userEmail: String = ""
    @State private var userName: String = ""
    @State private var userPassword: String = ""
    @State private var userPasswordCheck: String = ""
    
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
                            .textInputAutocapitalization(.never)
                            .keyboardType(.emailAddress)
                            .textContentType(.emailAddress)
                        TextField("ユーザーネーム", text: $userName)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color.customTrueWhite)
                            .cornerRadius(8)
                            .shadow(color: Color.customPrimary, radius: 2)
                            .foregroundColor(.customBlack)
                            .font(.custom(Font.customMedium, size: UIScreen.screenWidth / 24))
                            .textInputAutocapitalization(.never)
                        SecureField("パスワード", text: $userPassword)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color.customTrueWhite)
                            .cornerRadius(8)
                            .shadow(color: Color.customPrimary, radius: 2)
                            .foregroundColor(.customBlack)
                            .font(.custom(Font.customMedium, size: UIScreen.screenWidth / 24))
                        SecureField("パスワード（再入力）", text: $userPasswordCheck)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color.customTrueWhite)
                            .cornerRadius(8)
                            .shadow(color: Color.customPrimary, radius: 2)
                            .foregroundColor(.customBlack)
                            .font(.custom(Font.customMedium, size: UIScreen.screenWidth / 24))
                        Button(action: { register() }) {
                            HStack {
                                Spacer()
                                Text("会員登録")
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
        }
    }
    
    private func register() {
        dismiss()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
