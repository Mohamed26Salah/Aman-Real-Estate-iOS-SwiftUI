//
//  ProfileCoordinator.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 26/12/2023.
//

import SwiftUI

struct ProfileCoordinatorView: View {
    @StateObject private var coordinator = ProfileCoordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .profile)
                .navigationDestination(for: ProfilePage.self) { page in
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
    ProfileCoordinatorView()
}

