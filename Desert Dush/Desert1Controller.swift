//
//  ViewController.swift
//  Desert Dush
//
//  Created by Ravil on 07.03.2024.
//

import UIKit
import SnapKit

final class Desert1Controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImageView()
        image.image = UIImage(named: "desertonbo1")
        view.addSubview(image)
        
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "desertNext"), for: .normal)
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
        let vc = Desert2Controller()
        vc.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(vc, animated: false)
    }
}

