//
//  Desert2Controller.swift
//  Desert Dush
//
//  Created by Ravil on 07.03.2024.
//

import UIKit
import SnapKit

final class Desert2Controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImageView()
        image.image = UIImage(named: "desertonbo2")
        view.addSubview(image)
        
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "desertStart"), for: .normal)
        button.addTarget(self, action: #selector(desertTap), for: .touchUpInside)
        view.addSubview(button)
        
        button.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
            make.centerX.equalToSuperview()
        }
        
        let rightImage = UIImage(named: "desertClose")
        let rightBarButtonItem = UIBarButtonItem(image: rightImage, style: .plain, target: self, action: #selector(desertClose))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc private func desertClose() {
        let vc = DesertMenuController()
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
    
    @objc private func desertTap() {
        let vc = DesertMenuController()
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
        
        UserDefaults.standard.set(true, forKey: "ass")
        print("Value of 'ass' key is set to true")
    }
}
