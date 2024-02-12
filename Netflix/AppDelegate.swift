//
//  AppDelegate.swift
//  Netflix
//
//  Created by Raj Guggilla on 07/02/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
}


//MARK: Launch Time
extension AppDelegate {
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
#if DEBUG
        print("Application - First Intialisation - willFinishLaunchingWithOptions")
#endif
        return true
    }

    
    func application(_ application: UIApplication, shouldRestoreSecureApplicationState coder: NSCoder) -> Bool {
#if DEBUG
        print("Application - Restoration - shouldRestoreSecureApplicationState")
#endif
        return true
    }
    
    func application(_ application: UIApplication, didDecodeRestorableStateWith coder: NSCoder) {
#if DEBUG
        print("Application - Restoration - didDecodeRestorableStateWith")
#endif
        
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
#if DEBUG
        print("Application - Final Intialisation - didFinishLaunchingWithOptions")
#endif
        
        return true
    }
    
}


//MARK: Application Lifecycle Events
extension AppDelegate {
    
    func applicationWillEnterForeground(_ application: UIApplication) {
#if DEBUG
        print("Application - applicationWillEnterForeground")
#endif
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
#if DEBUG
        print("Application - applicationDidBecomeActive")
#endif
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
#if DEBUG
        print("Application - applicationWillResignActive")
#endif
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
#if DEBUG
        print("Application - applicationDidEnterBackground")
#endif
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
#if DEBUG
        print("Application - applicationWillTerminate")
#endif
    }
    
    
}
