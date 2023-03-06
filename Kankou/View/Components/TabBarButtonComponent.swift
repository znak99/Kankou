//
//  TabBarButtonComponent.swift
//  Kankou
//
//  Created by seungwoo on 2023/03/05.
//

import SwiftUI

struct TabBarButtonComponent: View {
    
    private var systemName: String
    private var text: String
    
    @Binding var isSelected: Bool
    
    init(
        _ systemName: String,
        _ text: String,
        _ isSelected: Binding<Bool> = .constant(false)
    ) {
        self.systemName = systemName
        self.text = text
        _isSelected = isSelected
    }
    
    var body: some View {
        VStack {
            Image(systemName: systemName)
                .font(.subheadline)
                .fontWeight(.bold)
            Text(text)
                .font(.custom(Font.customFredoka, size: UIScreen.screenWidth / 35))
        }
        .foregroundColor(isSelected ? .customPrimary : .customGray)
        .padding(.vertical, 4)
    }
}

struct TabBarButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButtonComponent("house", "Home")
    }
}
