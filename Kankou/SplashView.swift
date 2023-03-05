//
//  SplashView.swift
//  Kankou
//
//  Created by seungwoo on 2023/03/05.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            Image("TextLogo")
                .resizable()
                .scaledToFit()
                .padding()
                .blur(radius: isAnimating ? 0 : 20)
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        isAnimating = true
                    }
                }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
