//
//  HomeView.swift
//  Kankou
//
//  Created by seungwoo on 2023/03/05.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showMainView = false
    
    var body: some View {
        NavigationView {
            if !showMainView {
                SplashView()
            } else {
                Text("NM")
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
