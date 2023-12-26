//
//  NavigationBarView.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 26/12/2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case Explore
    case Favorite
    case Message
    case Account
}

struct NavigationBarView: View {
    @State var selectedTap: Tab = .Explore
    var body: some View {
        ZStack {
            TabView(selection: $selectedTap) {
                Text(Tab.Explore.rawValue)
                    .tabItem {
                        Label(Tab.Explore.rawValue, image: selectedTap == .Explore ? SystemDesign.AppImages.HomeFilled.name : SystemDesign.AppImages.Home.name)
                    }
                    .tag(Tab.Explore)
                Text(Tab.Favorite.rawValue)
                    .tabItem {
                        Label(Tab.Favorite.rawValue, image: selectedTap == .Favorite ? SystemDesign.AppImages.FavoriteFilled.name : SystemDesign.AppImages.Favorite.name)
                    }
                    .tag(Tab.Favorite)
                Text(Tab.Message.rawValue)
                    .tabItem {
                        Label(Tab.Message.rawValue, image: selectedTap == .Message ? SystemDesign.AppImages.MessageFilled.name : SystemDesign.AppImages.Message.name)
                    }
                    .tag(Tab.Message)
                Text(Tab.Account.rawValue)
                    .tabItem {
                        Label(Tab.Account.rawValue, image: selectedTap == .Account ? SystemDesign.AppImages.AccountFilled.name : SystemDesign.AppImages.Account.name)
                    }
                    .tag(Tab.Account)
            }
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        
    }
}

#Preview {
    NavigationBarView()
}
