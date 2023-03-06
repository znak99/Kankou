//
//  AuthenticationLogoComponent.swift
//  Kankou
//
//  Created by seungwoo on 2023/03/06.
//

import SwiftUI

struct AuthenticationLogoComponent: View {
    var body: some View {
        Image("TextLogo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: UIScreen.screenWidth / 3)
            .padding(.top, UIScreen.screenHeight / 12)
            .padding(.bottom)
    }
}

struct AuthenticationLogoComponent_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationLogoComponent()
    }
}
