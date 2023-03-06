//
//  CustomIndicatorComponent.swift
//  Kankou
//
//  Created by seungwoo on 2023/03/06.
//

import SwiftUI

struct CustomIndicatorComponent: View {
    
    @State private var topItemXAxis: CGFloat = -UIScreen.screenWidth / 60
    @State private var bottomItemXAxis: CGFloat = UIScreen.screenWidth / 60
    
    var body: some View {
        VStack {
            Image("IndicatorSource")
                .resizable()
                .frame(width: UIScreen.screenWidth / 12, height: UIScreen.screenHeight / 80)
                .scaledToFit()
                .offset(x: topItemXAxis)
            Image("IndicatorSource")
                .resizable()
                .frame(width: UIScreen.screenWidth / 12, height: UIScreen.screenHeight / 80)
                .scaledToFit()
                .offset(x: bottomItemXAxis)
        }
        .padding(.all, UIScreen.screenWidth / 24)
        .background(Color.customPrimary)
        .cornerRadius(12)
        .opacity(0.7)
        .onAppear {
            withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                topItemXAxis = UIScreen.screenWidth / 60
                bottomItemXAxis = -UIScreen.screenWidth / 60
            }
        }
    }
}

struct CustomIndicatorComponent_Previews: PreviewProvider {
    static var previews: some View {
        CustomIndicatorComponent()
    }
}
