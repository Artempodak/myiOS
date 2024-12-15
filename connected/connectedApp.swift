//
//  connectedApp.swift
//  connected
//
//  Created by Artem Podorozhniy on 09.12.2024.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}



@main
struct connectedApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @ObservedObject var loginViewModel = LoginViewModel()
    var body: some Scene {
        WindowGroup {
            if loginViewModel.isLogin {
                CustomTabBarView()
                    .environmentObject(loginViewModel)
            } else{
                EnterMailView()
                    .environmentObject(loginViewModel)
            }
        }
    }
}
