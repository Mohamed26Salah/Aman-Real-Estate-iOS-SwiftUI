//
//  HomeCoordinator.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 13/02/2024.
//

import SwiftUI

enum HomePage: Hashable, Equatable {
    case home
}

enum HomeSheet: Identifiable, Equatable {
    case welcome
    
    var id: Self { self }
}

enum HomeFullScreenCover: Identifiable, Equatable {
    case welcome
    
    var id: Self { self }
}

class HomeCoordinator: GenericCoordinator<HomePage, HomeSheet, HomeFullScreenCover> {
   
    @ViewBuilder
    func build(page: HomePage) -> some View {
        switch page {
        case .home:
           HomeView()
        }
    }
    
    @ViewBuilder
    func build(sheet: HomeSheet) -> some View {
        switch sheet {
        case .welcome:
            EmptyView()
        }
    }
    
    @ViewBuilder
    func build(fullScreenCover: HomeFullScreenCover) -> some View {
        switch fullScreenCover {
        case .welcome:
            EmptyView()
        }
    }
}

