//
//  AppDelegate.swift
//  Desert Dush
//
//  Created by Ravil on 07.03.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        DesertConstant.setupFirstLaunch()
        return true
    }
}
