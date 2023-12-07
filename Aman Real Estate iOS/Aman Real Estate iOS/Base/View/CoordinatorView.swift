//
//  CoordinatorView.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 07/12/2023.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coordinator = AuthCoordinator()
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .login)
                .navigationDestination(for: AuthPage.self) { page in
                    coordinator.build(page: page)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.build(sheet: sheet)
                }
                .fullScreenCover(item: $coordinator.fullScreenCover) { fullScreenCover in
                    coordinator.build(fullScreenCover: fullScreenCover)
                }
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    CoordinatorView()
}
