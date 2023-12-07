//
//  ContentView2.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 07/12/2023.
//

import SwiftUI

struct ContentView2: View {
    @EnvironmentObject private var coordinator: AuthCoordinator
    var body: some View {
        VStack {
            Button {
                coordinator.dismissSheet()
            } label: {
                Text("Baaaack")
            }
        }

    }
}

#Preview {
    ContentView2()
}
