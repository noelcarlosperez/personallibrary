//
//  AppDelegate.swift
//  PersonalLibrary
//
//  Created by Noel Perez on 11/28/17.
//  Copyright © 2017 Noel C. Perez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var libraryCoordinator: LibraryCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let tabBarController = StoryboardScene.Library.initialScene.instantiate()
        window?.rootViewController = tabBarController
        
        libraryCoordinator = LibraryCoordinator(tabBarController: tabBarController, authenticator: FirebaseAuthenticator())
        
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }
}
