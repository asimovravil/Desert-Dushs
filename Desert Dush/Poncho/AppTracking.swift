//
//  File.swift
//  Desert Dush
//
//  Created by Vadim Brondz on 19.03.2024.
//

import Foundation
import AppTrackingTransparency
import AdSupport


struct AppTracking {
    
    
    static func appTrackingResponse(completion: @escaping (ATTrackingManager.AuthorizationStatus) -> Void) {
        
        ATTrackingManager.requestTrackingAuthorization { status in
            DispatchQueue.main.async {
                completion(status)
            }
        }
    }
}

