//
//  NavigationViewBackButtonComponent.swift
//  Kankou
//
//  Created by seungwoo on 2023/03/06.
//

import SwiftUI

struct NavigationViewBackButtonComponent: View {
    
    var dismiss: DismissAction
    
    init(dismiss: DismissAction) {
        self.dismiss = dismiss
    }
    
    var body: some View {
        VStack {
            HStack {
                Button { dismiss() } label: {
                    Image(systemName: "chevron.backward")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.customAccentBlue)
                        .padding()
                }

                Spacer()
            }
            Spacer()
        }
    }
}

struct NavigationViewBackButtonComponent_Previews: PreviewProvider {
    
    @Environment(\.dismiss) private static var dismiss
    
    static var previews: some View {
        NavigationViewBackButtonComponent(dismiss: dismiss)
    }
}
