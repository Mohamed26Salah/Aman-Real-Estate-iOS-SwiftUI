//
//  NavigationBarModifier.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 26/12/2023.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {
    @Environment(\.presentationMode) var presentationMode

    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.backward") // Use your own image here
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.neutrals900) // Your desired color
                            .frame(width: 40, height: 40)
                            .background(.neutrals100) // Your desired color
                            .clipShape(Circle())
                    }
                }
            }
    }
}

extension View {
    func customBackButton() -> some View {
        self.modifier(NavigationBarModifier())
    }
}


