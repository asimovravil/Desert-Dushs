//
//  OnesignalPush.swift
//  Desert Dush
//
//  Created by Vadim Brondz on 19.03.2024.
//

import Foundation
import AppsFlyerLib
import OneSignalFramework
import AppTrackingTransparency


struct OnesignalPush {
    
    static var launch: [UIApplication.LaunchOptionsKey: Any]?
    
    static func initPush(completion: @escaping (ATTrackingManager.AuthorizationStatus) -> Void) {
        OneSignal.initialize(
            DesertConstant.onesignalKey,
            withLaunchOptions: launch
        )
        OneSignal.Notifications.requestPermission({ accepted in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                AppTracking.appTrackingResponse { status in
                    completion(status)
                }
            }
        }, fallbackToSettings: true)
        OneSignal.login(AppsFlyerLib.shared().getAppsFlyerUID())
    }
}
