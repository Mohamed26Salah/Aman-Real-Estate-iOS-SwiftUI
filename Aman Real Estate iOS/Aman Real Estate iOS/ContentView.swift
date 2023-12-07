//
//  ContentView.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 07/12/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var coordinator: AuthCoordinator
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button {
                coordinator.present(sheet: .privacyPolicy)
            } label: {
                Text("Goooooo")
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
