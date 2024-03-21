//
//  DesertShopController.swift
//  Desert Dush
//
//  Created by Ravil on 07.03.2024.
//

import UIKit
import SnapKit

final class DesertShopController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let image = UIImageView()
        image.image = UIImage(named: "desertBG")
        view.addSubview(image)
        
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let scrollView = UIScrollView()
        let containerView = UIView()
        let cardShop = UIImageView()
        
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        cardShop.image = UIImage(named: "desertCardShop")
        containerView.addSubview(cardShop)
        
        cardShop.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top).offset(28)
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalTo(scrollView.snp.bottom).offset(-32)
        }
        
        let imageView = UIImageView(image: UIImage(named: "desertNavShop"))
        navigationItem.titleView = imageView
        
        let leftImage = UIImage(named: "desertBack")
        let leftBarButtonItem = UIBarButtonItem(image: leftImage, style: .plain, target: self, action: #selector(desertBack))
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc private func desertBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
