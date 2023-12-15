//
//  Aman_Real_Estate_iOSApp.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 07/12/2023.
//

import SwiftUI
import Firebase

@main
struct Aman_Real_Estate_iOSApp: App {
//    init() {
//        FirebaseApp.configure()
//    }
    var body: some Scene {
        WindowGroup {
            ContainerView()
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
