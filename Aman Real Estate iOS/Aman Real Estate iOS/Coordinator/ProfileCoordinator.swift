//
//  ProfileCoordinator.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 26/12/2023.
//

import Foundation
import SwiftUI

enum ProfilePage: Hashable, Equatable {
    case profile
}

enum ProfileSheet: Identifiable, Equatable {
    case welcome
    
    var id: Self { self }
}

enum ProfileFullScreenCover: Identifiable, Equatable {
    case welcome
    
    var id: Self { self }
}

class ProfileCoordinator: GenericCoordinator<ProfilePage, ProfileSheet, ProfileFullScreenCover> {
   
    @ViewBuilder
    func build(page: ProfilePage) -> some View {
        switch page {
        case .profile:
           ProfileView()
        }
    }
    
    @ViewBuilder
    func build(sheet: ProfileSheet) -> some View {
        switch sheet {
        case .welcome:
            EmptyView()
        }
    }
    
    @ViewBuilder
    func build(fullScreenCover: ProfileFullScreenCover) -> some View {
        switch fullScreenCover {
        case .welcome:
            EmptyView()
        }
    }
}

