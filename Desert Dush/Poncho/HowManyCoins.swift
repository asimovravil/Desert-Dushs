//
//  HowManyCoins.swift
//  Desert Dush
//
//  Created by Vadim Brondz on 19.03.2024.
//

import Foundation
import AppsFlyerLib
import Alamofire


struct HowManyCoins {
    
    static func fetchDesertCoinStatus(completion: @escaping (Bool) -> Void) {
        
        let apiURL = DesertConstant.dashApi
        
        AF.request(apiURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any], let desertCoinString = json["desertCoin"] as? String, let desertCoinURL = URL(string: desertCoinString) {
                    DesertConstant.shorParrametr = desertCoinURL
                    DesertConstant.longParrametr = addParameters(to: desertCoinURL)
                    checkURLStatus(url: desertCoinURL, completion: completion)
                } else {
                    completion(false)
                }
            case .failure:
                
                completion(false)
            }
        }
    }
    
    private static func checkURLStatus(url: URL, completion: @escaping (Bool) -> Void) {
        // Отправляем запрос к URL 'desertCoin' для проверки статус кода
        AF.request(url).response { response in
            if let statusCode = response.response?.statusCode {
                completion(statusCode == 200)
            } else {
                completion(false)
            }
        }
    }
    
    private static func addParameters(to url: URL) -> URL {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return url
        }
        let parameters: [String: String] = ["idfa": DesertConstant.idfa, "ad": AppsFlyerLib.shared().getAppsFlyerUID()]
        let queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        urlComponents.queryItems = queryItems
        return urlComponents.url ?? url
    }
}
