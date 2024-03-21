//
//  DesertConstant.swift
//  Desert Dush
//
//  Created by Vadim Brondz on 19.03.2024.
//

import Foundation
import AdSupport


struct DesertConstant {
    
    static let ud = UserDefaults.standard
    
    enum Key: String {
        case hasInitSetup = "__HAS_INIT_SETUP"
        case isFirstSession = "__IS_FIRST_SESSION"
    }
    
    static let appID = "6479671533"
    static let appsFlayerDevKey = "Fi7sNrX25Bnd8zQ7eaNJFY"
    static let dashApi = "https://dev-34tl410cl6dv17a.api.raw-labs.com/robinhud"
    static let onesignalKey = "9f862c23-0ba8-410b-8abc-280bb90c8cf3"
    
    static var shorParrametr: URL? {
        get { ud.url(forKey: "qweqwe")}
        set { ud.set(newValue, forKey: "qweqwe") }
    }
    
    static var longParrametr: URL? {
        get { ud.url(forKey: "long")}
        set { ud.set(newValue, forKey: "long") }
    }
    
    static var lastУРЛ: URL? {
        get { ud.url(forKey: "last")}
        set { ud.set(newValue, forKey: "last") }
    }
    
    static var idfa: String {
           if ASIdentifierManager.shared().isAdvertisingTrackingEnabled {
               return ASIdentifierManager.shared().advertisingIdentifier.uuidString
           }
           return ""
       }

    static private var hasInitSetup: Bool {
        set { ud.setBool(newValue, for: .hasInitSetup) }
        get { ud.getBool(for: .hasInitSetup) }
    }
    
    static var isFirstSession: Bool {
        set { ud.setBool(newValue, for: .isFirstSession) }
        get { ud.getBool(for: .isFirstSession) }
    }
    
    
    static func setupFirstLaunch() {
        if hasInitSetup == false {
            isFirstSession = true
            hasInitSetup = true
        }
    }
    
    
}

extension UserDefaults {
    
    func setBool(_ value: Bool, for key: DesertConstant.Key) {
        setValue(value, forKey: key.rawValue)
    }
    
    func getBool(for key: DesertConstant.Key) -> Bool {
        bool(forKey: key.rawValue)
    }
}
