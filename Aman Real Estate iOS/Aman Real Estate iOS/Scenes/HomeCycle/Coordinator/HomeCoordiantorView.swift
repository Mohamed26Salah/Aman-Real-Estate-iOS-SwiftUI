//
//  HomeCoordiantorView.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 13/02/2024.
//

import SwiftUI

struct HomeCoordiantorView: View {
    @StateObject private var coordinator = HomeCoordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .home)
                .navigationDestination(for: HomePage.self) { page in
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
