//
//  DesertMenuController.swift
//  Desert Dush
//
//  Created by Ravil on 07.03.2024.
//

import UIKit
import SnapKit

final class DesertMenuController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImageView()
        image.image = UIImage(named: "desertMenuBG")
        view.addSubview(image)
        
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // Создание горизонтального стек вью
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 45
        stackView.alignment = .center
        view.addSubview(stackView)
        
        // Создание кнопок и добавление их в стек вью
        let buttonLevel1 = createButton(withImage: "desertShop")
        let buttonLevel2 = createButton(withImage: "desertRules")
        let buttonLevel3 = createButton(withImage: "desertSettings")
        
        stackView.addArrangedSubview(buttonLevel1)
        stackView.addArrangedSubview(buttonLevel2)
        stackView.addArrangedSubview(buttonLevel3)
        
        buttonLevel1.addTarget(self, action: #selector(buttonLevel1Tap), for: .touchUpInside)
        buttonLevel2.addTarget(self, action: #selector(buttonLevel2Tap), for: .touchUpInside)
        buttonLevel3.addTarget(self, action: #selector(buttonLevel3Tap), for: .touchUpInside)
        
        stackView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
            make.centerX.equalToSuperview()
        }
        
        let buttonLevel = UIButton(type: .custom)
        buttonLevel.setImage(UIImage(named: "desertLevel1"), for: .normal)
        buttonLevel.addTarget(self, action: #selector(desertTap), for: .touchUpInside)
        view.addSubview(buttonLevel)
        
        buttonLevel.snp.makeConstraints { make in
            make.bottom.equalTo(stackView.snp.top).offset(-40)
            make.centerX.equalToSuperview()
        }
    }
    
    private func createButton(withImage imageName: String) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: imageName), for: .normal)
        return button
    }
    
    @objc private func desertTap() {
        let vc = DesertModeController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func buttonLevel1Tap() {
        let vc = DesertShopController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func buttonLevel2Tap() {
        let vc = DesertHistoryController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func buttonLevel3Tap() {
        let vc = DesertSettingsController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
