//
//  AppsFlayer.swift
//  Desert Dush
//
//  Created by Vadim Brondz on 19.03.2024.
//

import Foundation
import AppsFlyerLib

struct AppsFlayer {
    
    static func initAppsFlayer() {
        AppsFlyerLib.shared().appsFlyerDevKey = DesertConstant.appsFlayerDevKey
        AppsFlyerLib.shared().appleAppID = DesertConstant.appID
    }
}
