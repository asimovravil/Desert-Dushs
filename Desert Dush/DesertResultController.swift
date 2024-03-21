//
//  DesertResultController.swift
//  Desert Dush
//
//  Created by Ravil on 07.03.2024.
//

import UIKit
import SnapKit

final class DesertResultController: UIViewController {
    
    var userCorrectAnswers = 0
    var userIncorrectAnswers = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImageView()
        
        if userCorrectAnswers < 7 {
            image.image = UIImage(named: "desertLose")
        } else {
            image.image = UIImage(named: "desertWin")
        }        
        view.addSubview(image)
        
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let button = UIButton(type: .custom)
        if userCorrectAnswers < 7 {
            button.setImage(UIImage(named: "desertTryAgain"), for: .normal)
        } else {
            button.setImage(UIImage(named: "desertNextLevel"), for: .normal)
        }
        button.addTarget(self, action: #selector(desertClose), for: .touchUpInside)
        view.addSubview(button)
        
        button.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
            make.centerX.equalToSuperview()
        }
        
        let labelSuccess = UILabel()
        labelSuccess.text = "\(userCorrectAnswers)"
        labelSuccess.textColor = UIColor(named: "desertGreen")
        labelSuccess.font = UIFont(name: "Copyduck", size: 64)
        view.addSubview(labelSuccess)
        
        labelSuccess.snp.makeConstraints { make in
            make.leading.equalTo(button.snp.leading).offset(12)
            make.bottom.equalTo(button.snp.top).offset(-72)
        }
        
        let labelWrong = UILabel()
        labelWrong.text = "\(userIncorrectAnswers)"
        labelWrong.textColor = UIColor(named: "desertRed")
        labelWrong.font = UIFont(name: "Copyduck", size: 64)
        view.addSubview(labelWrong)
        
        labelWrong.snp.makeConstraints { make in
            make.trailing.equalTo(button.snp.trailing).offset(-12)
            make.bottom.equalTo(button.snp.top).offset(-72)
        }
        
        let imageSucces = UIImageView()
        imageSucces.image = UIImage(named: "desertSuccess")
        view.addSubview(imageSucces)
        
        imageSucces.snp.makeConstraints { make in
            make.bottom.equalTo(labelSuccess.snp.top).offset(-24)
            make.centerX.equalTo(labelSuccess.snp.centerX)
        }
        
        let imageWrong = UIImageView()
        imageWrong.image = UIImage(named: "desertWrong")
        view.addSubview(imageWrong)
        
        imageWrong.snp.makeConstraints { make in
            make.bottom.equalTo(labelWrong.snp.top).offset(-24)
            make.centerX.equalTo(labelWrong.snp.centerX)
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
}
