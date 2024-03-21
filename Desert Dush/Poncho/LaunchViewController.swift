//
//  LaunchViewController.swift
//  Desert Dush
//
//  Created by Vadim Brondz on 19.03.2024.
//

import UIKit
import SnapKit

class LaunchViewController: UIViewController {
    
    private let back = UIImageView(image: UIImage(named: "desertSplash"))
    private let active = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActive()
        setupLaunch()
    }
    
    private func setupLaunch() {
        AppsFlayer.initAppsFlayer()
        if DesertConstant.isFirstSession {
            OnesignalPush.initPush { status in
                switch status {
                case .notDetermined, .authorized, .denied, .restricted:
                    self.launchScreen()
                @unknown default: break
                }
            }
        } else {
            launchScreen()
        }
    }
    
    private func setupActive() {
        view.addSubview(active)
        active.color = .black
        active.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
            make.bottom.equalToSuperview().inset(64)
        }
        active.startAnimating()
    }
  
    
    private func launchScreen() {
        HowManyCoins.fetchDesertCoinStatus { coins in
            if coins {
                print(DesertConstant.longParrametr)
                let vc = DushCoinViewController(game: DesertConstant.longParrametr!)
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
                
            } else {
                let vc = Desert1Controller()
                vc.navigationItem.hidesBackButton = true
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    

}

extension LaunchViewController {
    func setupUI() {
        view.addSubview(back)
        back.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
