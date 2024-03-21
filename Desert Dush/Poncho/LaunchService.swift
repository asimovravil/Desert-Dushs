//
//  LaunchService.swift
//  Desert Dush
//
//  Created by Vadim Brondz on 19.03.2024.
//

import Foundation
import UIKit


struct LaunchService {
    
    static func setupRootController() -> UIViewController {
        if let _ = DesertConstant.lastУРЛ {
            print("1")
            return LaunchLastGame()
        }
        
        if let _ = DesertConstant.shorParrametr {
            print("2")
            return LaunchShortGame()
        }
        return UserDefaults.standard.bool(forKey: "hasLaunchedBefore") ? launchMenu() : launchSplash()
    }
    
   private static func launchSplash() -> UIViewController {
       print("dsfdsf")
       print(DesertConstant.lastУРЛ, DesertConstant.shorParrametr)
        let splashGameController = LaunchViewController()
        let navigationController = UINavigationController(rootViewController: splashGameController)
        return navigationController
    }
    
    
   private static func launchMenu() -> UIViewController {
       print("3")
        let MenuGameController = DesertMenuController()
        let navigationController = UINavigationController(rootViewController: MenuGameController)
        return navigationController
    }
    
   private static func LaunchLastGame() -> UIViewController {
       return DushCoinViewController(game: DesertConstant.lastУРЛ!)
    }
    
   private static func LaunchShortGame() -> UIViewController {
        return DushCoinViewController(game: DesertConstant.shorParrametr!)
    }
}
