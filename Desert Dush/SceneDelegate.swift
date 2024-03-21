//
//  SceneDelegate.swift
//  Desert Dush
//
//  Created by Ravil on 07.03.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        desertSceneDelegate(windowScene: windowScene)
    }
    
    func desertSceneDelegate(windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        window.overrideUserInterfaceStyle = .light
        window.rootViewController = LaunchService.setupRootController()
        window.makeKeyAndVisible()
        self.window = window
    }
}
