//
//  DesertResultFriendsController.swift
//  Desert Dush
//
//  Created by Ravil on 12.03.2024.
//

import UIKit
import SnapKit

final class DesertResultFriendsController: UIViewController {
    
    var userCorrectAnswers = 0
    var userIncorrectAnswers = 0
    
    var playerOneCorrectAnswers = 0
    var playerOneIncorrectAnswers = 0
    var playerTwoCorrectAnswers = 0
    var playerTwoIncorrectAnswers = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImageView()
        
        image.image = UIImage(named: "desertPlayer1Win")
        view.addSubview(image)
        
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "desertNextLevel"), for: .normal)
        button.addTarget(self, action: #selector(desertClose), for: .touchUpInside)
        view.addSubview(button)
        
        button.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
            make.centerX.equalToSuperview()
        }
        
        let labelSuccessPlayer2 = UILabel()
        labelSuccessPlayer2.text = "\(playerTwoCorrectAnswers)"
        labelSuccessPlayer2.textColor = UIColor(named: "desertGreen")
        labelSuccessPlayer2.font = UIFont(name: "Copyduck", size: 64)
        view.addSubview(labelSuccessPlayer2)
        
        labelSuccessPlayer2.snp.makeConstraints { make in
            make.leading.equalTo(button.snp.leading).offset(45)
            make.bottom.equalTo(button.snp.top).offset(-25)
        }
        
        let labelWrongPlayer2 = UILabel()
        labelWrongPlayer2.text = "\(playerTwoIncorrectAnswers)"
        labelWrongPlayer2.textColor = UIColor(named: "desertRed")
        labelWrongPlayer2.font = UIFont(name: "Copyduck", size: 64)
        view.addSubview(labelWrongPlayer2)
        
        labelWrongPlayer2.snp.makeConstraints { make in
            make.trailing.equalTo(button.snp.trailing).offset(-45)
            make.bottom.equalTo(button.snp.top).offset(-25)
        }
        
        let desertCardPlayer2 = UIImageView()
        desertCardPlayer2.image = UIImage(named: "desertCardPlayer2")
        view.addSubview(desertCardPlayer2)
        
        desertCardPlayer2.snp.makeConstraints { make in
            make.bottom.equalTo(labelSuccessPlayer2.snp.top).offset(70)
            make.centerX.equalTo(button.snp.centerX)
        }
        
        let labelSuccessPlayer1 = UILabel()
        labelSuccessPlayer1.text = "\(playerOneCorrectAnswers)"
        labelSuccessPlayer1.textColor = UIColor(named: "desertGreen")
        labelSuccessPlayer1.font = UIFont(name: "Copyduck", size: 64)
        view.addSubview(labelSuccessPlayer1)
        
        labelSuccessPlayer1.snp.makeConstraints { make in
            make.leading.equalTo(button.snp.leading).offset(45)
            make.bottom.equalTo(desertCardPlayer2.snp.top).offset(-20)
        }
        
        let labelWrongPlayer1 = UILabel()
        labelWrongPlayer1.text = "\(playerOneIncorrectAnswers)"
        labelWrongPlayer1.textColor = UIColor(named: "desertRed")
        labelWrongPlayer1.font = UIFont(name: "Copyduck", size: 64)
        view.addSubview(labelWrongPlayer1)
        
        labelWrongPlayer1.snp.makeConstraints { make in
            make.trailing.equalTo(button.snp.trailing).offset(-45)
            make.bottom.equalTo(desertCardPlayer2.snp.top).offset(-20)
        }
        
        let desertCardPlayer1 = UIImageView()
        desertCardPlayer1.image = UIImage(named: "desertCardPlayer1")
        view.addSubview(desertCardPlayer1)
        
        desertCardPlayer1.snp.makeConstraints { make in
            make.bottom.equalTo(labelSuccessPlayer1.snp.top).offset(70)
            make.centerX.equalTo(button.snp.centerX)
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
