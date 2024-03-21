//
//  QuizTestTableViewCell.swift
//  QXTrading
//
//  Created by Ravil on 05.12.2023.
//

import UIKit
import SnapKit

final class DesertGameCell: UITableViewCell {
    
    weak var quizViewController: DesertGameController?
    
    var isFriendsModeActive: Bool = false
    
    static let reuseID = String(describing: DesertGameCell.self)
    var quizBrain = Desert()
    private var answerSelected = false
    var userCorrectAnswers = 0
    var userIncorrectAnswers = 0
    weak var navigationController: UINavigationController?
    
    var playerOneCorrectAnswers = 0
    var playerOneIncorrectAnswers = 0
    var playerTwoCorrectAnswers = 0
    var playerTwoIncorrectAnswers = 0
    
    private var lastQuestionAnsweredForPlayerOne = false
    private var lastQuestionAnsweredForPlayerTwo = false
    
    private let playerOneImageView = UIImageView()
    private let playerTwoImageView = UIImageView()
    private var isPlayerOneTurn = true
    
    // MARK: - UI
    
    private let desertCard = UIImageView()
    private let desertQuestion = UILabel()
    private let desertCount = UILabel()
    private let desertFirst = UIButton()
    private let desertSecond = UIButton()
    private let desertThird = UIButton()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        desertCard.image = UIImage(named: "desertQuestion")
        contentView.addSubview(desertCard)
        
        desertQuestion.textColor = UIColor(named: "desertPurple")
        desertQuestion.font = UIFont(name: "Copyduck", size: 24)
        desertQuestion.textAlignment = .center
        desertQuestion.numberOfLines = 4
        contentView.addSubview(desertQuestion)
        
        desertCount.text = "1/10"
        desertCount.textColor = UIColor(named: "desertPurple")?.withAlphaComponent(0.30)
        desertCount.font = UIFont(name: "Poppins-Bold", size: 16)
        desertCount.numberOfLines = 0
        contentView.addSubview(desertCount)
        
        desertFirst.setTitle("1 answer", for: .normal)
        desertFirst.setTitleColor(.white, for: .normal)
        desertFirst.titleLabel?.font = UIFont(name: "Poppins-Bold", size: 16)
        desertFirst.contentHorizontalAlignment = .center
        desertFirst.layer.cornerRadius = 31
        contentView.addSubview(desertFirst)
        
        desertSecond.setTitle("2 answer", for: .normal)
        desertSecond.setTitleColor(.white, for: .normal)
        desertSecond.titleLabel?.font = UIFont(name: "Poppins-Bold", size: 16)
        desertSecond.contentHorizontalAlignment = .center
        desertSecond.layer.cornerRadius = 31
        contentView.addSubview(desertSecond)
        
        desertThird.setTitle("3 answer", for: .normal)
        desertThird.setTitleColor(.white, for: .normal)
        desertThird.titleLabel?.font = UIFont(name: "Poppins-Bold", size: 16)
        desertThird.contentHorizontalAlignment = .center
        desertThird.layer.cornerRadius = 31
        contentView.addSubview(desertThird)
        
        desertFirst.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        desertSecond.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        desertThird.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        
        desertCard.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(40)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        desertQuestion.snp.makeConstraints { make in
            make.top.equalTo(desertCard.snp.top).offset(24)
            make.leading.equalTo(desertCard.snp.leading).offset(24)
            make.trailing.equalTo(desertCard.snp.trailing).offset(-24)
        }
        desertCount.snp.makeConstraints { make in
            make.bottom.equalTo(desertCard.snp.bottom).offset(-24)
            make.centerX.equalTo(desertCard.snp.centerX)
        }
        desertFirst.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalTo(desertSecond.snp.top).offset(-32)
            make.height.equalTo(70)
        }
        
        desertSecond.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalTo(desertThird.snp.top).offset(-32)
            make.height.equalTo(70)
        }
        desertThird.snp.makeConstraints { make in
            make.bottom.equalTo(contentView).offset(-72)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(70)
        }
        desertUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setFriendsMode(_ isActive: Bool) {
        isFriendsModeActive = isActive
        if isActive {
            setupPlayerImageViews()
            updateUIForCurrentPlayer()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if isFriendsModeActive {
            updateUIForCurrentPlayer()
        }
    }
    
    private func setupPlayerImageViews() {
        playerOneImageView.image = UIImage(named: "desertPlayer1Active")
        playerTwoImageView.image = UIImage(named: "desertPlayer2NotActive")
        
        // Добавляем изображения в contentView
        contentView.addSubview(playerOneImageView)
        contentView.addSubview(playerTwoImageView)
        
        playerOneImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.bottom.equalToSuperview()
        }
        playerTwoImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview()
        }
    }
    
    func updateUIForCurrentPlayer() {
        playerOneImageView.image = isPlayerOneTurn ? UIImage(named: "desertPlayer1Active") : UIImage(named: "desertPlayer1NonActive")
        playerTwoImageView.image = isPlayerOneTurn ? UIImage(named: "desertPlayer2NotActive") : UIImage(named: "desertPlayer2Active")
    }
    
    // MARK: - Actions
    
    @objc public func desertUI() {
        let questionText = quizBrain.getQuestionText()
        let answers = quizBrain.getAnswers()
        
        desertQuestion.text = questionText
        desertFirst.setTitle(answers[0], for: .normal)
        desertSecond.setTitle(answers[1], for: .normal)
        desertThird.setTitle(answers[2], for: .normal)
        
        desertCount.text = "\(quizBrain.questionNumber + 1)/\(quizBrain.quiz.count)"
        
        desertFirst.backgroundColor = UIColor(named: "desertPurple")
        desertFirst.layer.borderWidth = 5
        desertFirst.layer.borderColor = UIColor.white.withAlphaComponent(0.40).cgColor
        
        desertSecond.backgroundColor = UIColor(named: "desertPurple")
        desertSecond.layer.borderWidth = 5
        desertSecond.layer.borderColor = UIColor.white.withAlphaComponent(0.40).cgColor
        
        desertThird.backgroundColor = UIColor(named: "desertPurple")
        desertThird.layer.borderWidth = 5
        desertThird.layer.borderColor = UIColor.white.withAlphaComponent(0.40).cgColor
        
        answerSelected = false
    }
    
    @objc private func answerButtonTapped(_ sender: UIButton) {
        guard !answerSelected else { return }
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if isFriendsModeActive {
            if isPlayerOneTurn {
                userGotItRight ? (playerOneCorrectAnswers += 1) : (playerOneIncorrectAnswers += 1)
            } else {
                userGotItRight ? (playerTwoCorrectAnswers += 1) : (playerTwoIncorrectAnswers += 1)
            }
        } else {
            userGotItRight ? (userCorrectAnswers += 1) : (userIncorrectAnswers += 1)
        }

        sender.backgroundColor = userGotItRight ? UIColor(named: "desertYellow") : UIColor(named: "desertRed")
        sender.layer.cornerRadius = 31
        answerSelected = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.quizBrain.nextQuestion()
            if self.quizBrain.questionNumber == 0 { // Проверяем, был ли вопрос последним
                self.desertNavigate()
            } else {
                self.isPlayerOneTurn.toggle() // Переключаем ход
                self.updateUIForCurrentPlayer()
                self.desertUI()
            }
            
            self.answerSelected = false
        }
    }
    
    private func desertNavigate() {
        if isFriendsModeActive {
            let friendsResultController = DesertResultFriendsController()
            friendsResultController.playerOneCorrectAnswers = playerOneCorrectAnswers
            friendsResultController.playerOneIncorrectAnswers = playerOneIncorrectAnswers
            friendsResultController.playerTwoCorrectAnswers = playerTwoCorrectAnswers
            friendsResultController.playerTwoIncorrectAnswers = playerTwoIncorrectAnswers
            friendsResultController.navigationItem.hidesBackButton = true
            navigationController?.pushViewController(friendsResultController, animated: true)
        } else {
            let resultController = DesertResultController()
            resultController.userCorrectAnswers = userCorrectAnswers
            resultController.userIncorrectAnswers = userIncorrectAnswers
            resultController.navigationItem.hidesBackButton = true
            navigationController?.pushViewController(resultController, animated: true)
        }
    }
}

