// MARK: - Generic Coordinator

import SwiftUI

class GenericCoordinator<Page: Hashable & Equatable, Sheet: Identifiable & Equatable, FullScreenCover: Identifiable & Equatable>: ObservableObject {
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func present(sheet: Sheet) {
        self.sheet = sheet
    }
    
    func present(fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
//    @ViewBuilder
//    func build(page: Page) -> some View {
//        EmptyView()
//    }
//    
//    @ViewBuilder
//    func build(sheet: Sheet) -> some View {
//        EmptyView()
//    }
//    
//    @ViewBuilder
//    func build(fullScreenCover: FullScreenCover) -> some View {
//        EmptyView()
//    }
}
