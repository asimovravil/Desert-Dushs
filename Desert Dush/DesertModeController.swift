//
//  DesertModeController.swift
//  Desert Dush
//
//  Created by Ravil on 12.03.2024.
//

import UIKit
import SnapKit

final class DesertModeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImageView()
        image.image = UIImage(named: "desertBG")
        view.addSubview(image)
        
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let imageView = UIImageView(image: UIImage(named: "desertNavMode"))
        navigationItem.titleView = imageView
        
        let leftImage = UIImage(named: "desertBack")
        let leftBarButtonItem = UIBarButtonItem(image: leftImage, style: .plain, target: self, action: #selector(desertBack))
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        // Creating three buttons
        let button1 = UIButton()
        button1.setImage(UIImage(named: "desertFree"), for: .normal)
        
        let button2 = UIButton()
        button2.setImage(UIImage(named: "desertTimer"), for: .normal)
        
        let button3 = UIButton()
        button3.setImage(UIImage(named: "desertFriends"), for: .normal)
        
        button1.addTarget(self, action: #selector(handleFreeModeTap), for: .touchUpInside)
        button2.addTarget(self, action: #selector(handleTimerModeTap), for: .touchUpInside)
        button3.addTarget(self, action: #selector(handleFriendsModeTap), for: .touchUpInside)
        
        // Creating stack view and adding buttons
        let stackView = UIStackView(arrangedSubviews: [button1, button2, button3])
        stackView.axis = .vertical
        stackView.spacing = 40
        view.addSubview(stackView)
        
        // Constraints for stack view
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    @objc private func desertBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func handleFreeModeTap() {
        let desertGameController = DesertGameController(timerMode: false, friendsMode: false)
        desertGameController.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(desertGameController, animated: true)
    }
    
    @objc private func handleTimerModeTap() {
        let desertGameController = DesertGameController(timerMode: true, friendsMode: false)
        desertGameController.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(desertGameController, animated: true)
    }
    
    @objc private func handleFriendsModeTap() {
        let desertGameController = DesertGameController(timerMode: false, friendsMode: true)
        desertGameController.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(desertGameController, animated: true)
    }
}
