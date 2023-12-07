//
//  Coordinator.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 07/12/2023.
//
//
//import SwiftUI
//
//enum Page: String, Identifiable {
//    case apple, banana, carrot
//    
//    var id: String {
//        self.rawValue
//    }
//}
//
//enum Sheet: String, Identifiable {
//    case lemon
//    
//    var id: String {
//        self.rawValue
//    }
//}
//enum FullScreenCover: String, Identifiable {
//    case olive
//    
//    var id: String {
//        self.rawValue
//    }
//}
//
//class Coordinator: ObservableObject {
//    @Published var path = NavigationPath()
//    @Published var sheet: Sheet?
//    @Published var fullScreenCover: FullScreenCover?
//    
//    func push(_ page: Page) {
//        path.append(page)
//    }
//    
//    func present(sheet: Sheet) {
//        self.sheet = sheet
//    }
//    
//    func present(fullScreenCover: FullScreenCover) {
//        self.fullScreenCover = fullScreenCover
//    }
//    
//    func pop() {
//        path.removeLast()
//    }
//    
//    func popToRoot() {
//        path.removeLast(path.count)
//    }
//    
//    func dismissSheet() {
//        self.sheet = nil
//    }
//    
//    func dismissFullScreenCover() {
//        self.fullScreenCover = nil
//    }
//    
//    @ViewBuilder
//    func build(page: Page) -> some View {
//        switch page {
//        case .apple:
//            ContentView()
//        case .banana:
//            ContentView()
//        case .carrot:
//            ContentView()
//        }
//    }
//    
//    @ViewBuilder
//    func build(sheet: Sheet) -> some View {
//        switch sheet {
//        case .lemon:
//            ContentView()
//        }
//    }
//    
//    @ViewBuilder
//    func build(fullScreenCover: FullScreenCover) -> some View {
//        switch fullScreenCover {
//        case .olive:
//            ContentView()
//        }
//    }
//}
