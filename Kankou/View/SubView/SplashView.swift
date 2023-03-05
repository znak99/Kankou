//
//  SplashView.swift
//  Kankou
//
//  Created by seungwoo on 2023/03/05.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isAnimating = false
    @State private var xAxis: CGFloat = 0
    @State private var opacityAmount: CGFloat = 1
    
    var body: some View {
        ZStack {
            Color.customWhite.ignoresSafeArea()
            Image("TextLogo")
                .resizable()
                .scaledToFit()
                .padding()
                .blur(radius: isAnimating ? 0 : 20)
                .offset(x: xAxis)
                .opacity(opacityAmount)
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        isAnimating = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            self.xAxis -= 50
                            self.opacityAmount = 0
                        }
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
