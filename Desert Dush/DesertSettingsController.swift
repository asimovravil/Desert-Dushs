//
//  SettingsViewController.swift
//  AfflilateApp
//
//  Created by Ravil on 05.01.2024.
//

import UIKit
import StoreKit
import SnapKit

final class DesertSettingsController: UIViewController {
    
    let desertVibration = UIButton(type: .custom)

    override func viewDidLoad() {
        super.viewDidLoad()

        let image = UIImageView()
        image.image = UIImage(named: "desertBG")
        view.addSubview(image)
        
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let desertShare = UIButton(type: .custom)
        let desertPrivacy = UIButton(type: .custom)
        let desertRate = UIButton(type: .custom)
        
        desertVibration.setImage(UIImage(named: "desertVibrationOff"), for: .normal)
        desertVibration.addTarget(self, action: #selector(desertVibrationed), for: .touchUpInside)
        view.addSubview(desertVibration)
                
        desertVibration.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(90)
            make.centerX.equalToSuperview()
        }
        
        desertShare.setImage(UIImage(named: "desertShare"), for: .normal)
        desertShare.translatesAutoresizingMaskIntoConstraints = false
        desertShare.addTarget(self, action: #selector(desertShared), for: .touchUpInside)
        view.addSubview(desertShare)
        
        desertShare.snp.makeConstraints { make in
            make.top.equalTo(desertVibration.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        
        desertPrivacy.setImage(UIImage(named: "desertPrivacy"), for: .normal)
        desertPrivacy.translatesAutoresizingMaskIntoConstraints = false
        desertPrivacy.addTarget(self, action: #selector(desertPrivacied), for: .touchUpInside)
        view.addSubview(desertPrivacy)
        
        desertPrivacy.snp.makeConstraints { make in
            make.top.equalTo(desertShare.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        
        desertRate.setImage(UIImage(named: "desertRate"), for: .normal)
        desertRate.translatesAutoresizingMaskIntoConstraints = false
        desertRate.addTarget(self, action: #selector(desertRated), for: .touchUpInside)
        view.addSubview(desertRate)
        
        desertRate.snp.makeConstraints { make in
            make.top.equalTo(desertPrivacy.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        
        let imageView = UIImageView(image: UIImage(named: "desertNavSettings"))
        navigationItem.titleView = imageView
        
        let leftImage = UIImage(named: "desertBack")
        let leftBarButtonItem = UIBarButtonItem(image: leftImage, style: .plain, target: self, action: #selector(desertBack))
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc private func desertBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func desertShared() {
        let textToShare = "Check out this awesome app!"
        let appURL = URL(string: "https://www.yourappstorelink.com")!
        
        let activityViewController = UIActivityViewController(activityItems: [textToShare, appURL], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    @objc func desertRated() {
        SKStoreReviewController.requestReview()
    }
    
    @objc func desertPrivacied() {
        let controller = DushCoinViewController()
        self.present(controller, animated: true)
    }
    
    @objc private func desertVibrationed() {
        if desertVibration.isSelected {
            desertVibration.setImage(UIImage(named: "desertVibrationOff"), for: .normal)
        } else {
            desertVibration.setImage(UIImage(named: "desertVibration"), for: .normal)
        }
        // Переключение состояния кнопки
        desertVibration.isSelected.toggle()
    }

}

    


