//
//  TabBarView.swift
//  Kankou
//
//  Created by seungwoo on 2023/03/05.
//

import SwiftUI

struct TabBarView: View {
    
    private let HOME: String = "Home"
    private let PLAN: String = "Plan"
    private let WEATHER: String = "Weather"
    private let PROFILE: String = "Profile"
    
    private let tabBarUnderlineAnimDuration = 0.5
    
    @State private var homeSelected = true
    @State private var planSelected = false
    @State private var weatherSelected = false
    @State private var profileSelected = false
    
    @State private var currentView = "Home"
    @State private var showMainView = false
    
    @State private var tabBarUnderline = -UIScreen.screenWidth * 0.37
    @State private var tabBarUnderlineWidth: CGFloat = 10
    
    @State private var navigatorTextColor: Color = .customPrimary
    @State private var navigatorImageSize: CGFloat = 20
    
    var body: some View {
        ZStack {
            Color.customWhite.ignoresSafeArea()
            
            if currentView == HOME {
                HomeView()
            } else if currentView == PLAN {
                PlanView()
            } else if currentView == WEATHER {
                WeatherView()
            } else if currentView == PROFILE {
                ProfileView()
            }
            
            VStack(spacing: 0) {
                HStack {
                    Image("ImageLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(
                            width: UIScreen.screenWidth / navigatorImageSize,
                            height: UIScreen.screenWidth / navigatorImageSize
                        )
                    Text(currentView)
                        .foregroundColor(navigatorTextColor)
                        .font(.caption)
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)
                .padding(.vertical, 4)
                .frame(width: UIScreen.screenWidth / 2.5)
                .background(Color.customTrueWhite)
                .cornerRadius(12)
                .shadow(color: Color.customTrueBlack.opacity(0.3), radius: 4)
                .padding(.top, 4)
                
                    
                Spacer()
                HStack {
                    Button(action: {
                        withAnimation(.easeIn(duration: 0.1)) {
                            self.navigatorTextColor = .customTrueWhite
                            self.navigatorImageSize = 200
                        }
                        self.currentView = HOME
                        changeTabsState(true, false, false, false)
                        withAnimation(.easeIn(duration: tabBarUnderlineAnimDuration)) {
                            self.tabBarUnderlineWidth = 3
                        }
                        withAnimation {
                            tabBarUnderline = -UIScreen.screenWidth * 0.37
                        }
                        withAnimation(.easeInOut(duration: tabBarUnderlineAnimDuration)) {
                            self.tabBarUnderlineWidth = 10
                            self.navigatorTextColor = .customPrimary
                        }
                        withAnimation(.easeIn(duration: 0.3)) {
                            self.navigatorTextColor = .customPrimary
                            self.navigatorImageSize = 20
                        }
                    }) {
                        TabBarButtonComponent("house", HOME, $homeSelected)
                    }
                    .padding(.horizontal)
                    Spacer()
                    Button(action: {
                        withAnimation(.easeIn(duration: 0.1)) {
                            self.navigatorTextColor = .customTrueWhite
                            self.navigatorImageSize = 200
                        }
                        self.currentView = PLAN
                        changeTabsState(false, true, false, false)
                        withAnimation(.easeIn(duration: tabBarUnderlineAnimDuration)) {
                            self.tabBarUnderlineWidth = 3
                        }
                        withAnimation {
                            tabBarUnderline = -UIScreen.screenWidth * 0.138
                        }
                        withAnimation(.easeInOut(duration: tabBarUnderlineAnimDuration)) {
                            self.tabBarUnderlineWidth = 10
                            self.navigatorTextColor = .customPrimary
                        }
                        withAnimation(.easeIn(duration: 0.3)) {
                            self.navigatorTextColor = .customPrimary
                            self.navigatorImageSize = 20
                        }
                    }) {
                        TabBarButtonComponent("list.bullet", PLAN, $planSelected)
                    }
                    .padding(.horizontal)
                    Spacer()
                    Button(action: {
                        withAnimation(.easeIn(duration: 0.1)) {
                            self.navigatorTextColor = .customTrueWhite
                            self.navigatorImageSize = 200
                        }
                        self.currentView = WEATHER
                        changeTabsState(false, false, true, false)
                        withAnimation(.easeIn(duration: tabBarUnderlineAnimDuration)) {
                            self.tabBarUnderlineWidth = 3
                        }
                        withAnimation {
                            tabBarUnderline = UIScreen.screenWidth * 0.105
                        }
                        withAnimation(.easeInOut(duration: tabBarUnderlineAnimDuration)) {
                            self.tabBarUnderlineWidth = 10
                            self.navigatorTextColor = .customPrimary
                        }
                        withAnimation(.easeIn(duration: 0.3)) {
                            self.navigatorTextColor = .customPrimary
                            self.navigatorImageSize = 20
                        }
                    }) {
                        TabBarButtonComponent("thermometer.low", WEATHER, $weatherSelected)
                    }
                    .padding(.horizontal)
                    Spacer()
                    Button(action: {
                        withAnimation(.easeIn(duration: 0.1)) {
                            self.navigatorTextColor = .customTrueWhite
                            self.navigatorImageSize = 200
                        }
                        self.currentView = PROFILE
                        changeTabsState(false, false, false, true)
                        withAnimation(.easeIn(duration: tabBarUnderlineAnimDuration)) {
                            self.tabBarUnderlineWidth = 3
                        }
                        withAnimation {
                            tabBarUnderline = UIScreen.screenWidth * 0.369
                        }
                        withAnimation(.easeInOut(duration: tabBarUnderlineAnimDuration)) {
                            self.tabBarUnderlineWidth = 10
                            self.navigatorTextColor = .customPrimary
                        }
                        withAnimation(.easeIn(duration: 0.3)) {
                            self.navigatorTextColor = .customPrimary
                            self.navigatorImageSize = 20
                        }
                    }) {
                        TabBarButtonComponent("person", PROFILE, $profileSelected)
                    }
                    .padding(.horizontal)
                }
                .background(Color.customTrueWhite)
                .cornerRadius(12)
                .shadow(color: Color.customTrueBlack.opacity(0.3), radius: 4)
                .padding()
                
                Color.customPrimary
                    .frame(width: UIScreen.screenWidth / self.tabBarUnderlineWidth, height: 8)
                    .cornerRadius(12)
                    .offset(x: self.tabBarUnderline)
                    .shadow(color: Color.customTrueBlack, radius: 2)
            }
            
            if !showMainView {
                SplashView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.showMainView = true
                }
            }
        }
    }
    
    private func changeTabsState(
        _ home: Bool,
        _ plan: Bool,
        _ weather: Bool,
        _ profile: Bool
    ) {
        self.homeSelected = home
        self.planSelected = plan
        self.weatherSelected = weather
        self.profileSelected = profile
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
