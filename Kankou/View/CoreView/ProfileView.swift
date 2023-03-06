//
//  ProfileView.swift
//  Kankou
//
//  Created by seungwoo on 2023/03/05.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.customWhite.ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        NavigationLink {
                            LoginView()
                        } label: {
                            HStack {
                                Image("DefaultProfileImg")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(
                                        width: UIScreen.screenWidth / 7,
                                        height: UIScreen.screenWidth / 7,
                                        alignment: .center
                                    )
                                    .overlay(
                                        Circle()
                                            .stroke(Color.customWhite, lineWidth: 2.5)
                                            .background(Color.customWhite.opacity(0.2))
                                    )
                                    .clipShape(Circle())
                                    .padding()
                                Text("ログインしてください")
                                    .font(.custom(Font.customExtraBold, size: UIScreen.screenWidth / 25))
                                    .foregroundColor(.customWhite)
                                    .padding()
                                Spacer()
                            }
                            .background(Color.customPrimary)
                            .cornerRadius(12)
                            .shadow(color: Color.customGray, radius: 8)
                            .padding(.top, UIScreen.screenHeight / 12)
                            .padding(.horizontal)
                        }

                    }
                }
            }
            .toolbar(.hidden)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
