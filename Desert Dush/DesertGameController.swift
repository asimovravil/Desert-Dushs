//
//  QuizTestViewController.swift
//  QXTrading
//
//  Created by Ravil on 05.12.2023.
//

import UIKit
import SnapKit

final class DesertGameController: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .plain)
    private var questionResults = [Bool]()
    var onQuizCompletion: ((Int, Int) -> Void)?
    
    private var timerView: UIView?
    private var countdownTimer: Timer?
    private var remainingSeconds: Int = 330
    public var friendsMode: Bool
    
    private var timerMode: Bool
    private var timerLabel = UILabel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImageView()
        image.image = UIImage(named: "desertBG")
        view.addSubview(image)
        
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.register(DesertGameCell.self, forCellReuseIdentifier: DesertGameCell.reuseID)
        tableView.layer.cornerRadius = 26
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.rowHeight = 700
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let imageView = UIImageView(image: UIImage(named: "desertNavLevel1"))
        navigationItem.titleView = imageView
        
        if friendsMode {
            // Настройка режима с друзьями
        } else if timerMode {
            setupTimerView()
            startTimer()
        }
    }
    
    init(timerMode: Bool = false, friendsMode: Bool = false) {
        self.timerMode = timerMode
        self.friendsMode = friendsMode
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTimerView() {
        let desertCardTimer = UIImageView()
        desertCardTimer.image = UIImage(named: "desertCardTimer")
        view.addSubview(desertCardTimer)
        
        desertCardTimer.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.centerX.equalToSuperview()
        }
        
        timerLabel.text = "5:30"
        timerLabel.textColor = .white
        timerLabel.font = UIFont(name: "Poppins-Bold", size: 24)
        view.addSubview(timerLabel)
        
        timerLabel.snp.makeConstraints { make in
            make.center.equalTo(desertCardTimer.snp.center)
        }
        
        updateTimerLabel()
    }

    private func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @objc private func updateTimer() {
        if remainingSeconds > 0 {
            remainingSeconds -= 1
            updateTimerLabel()
        } else {
            countdownTimer?.invalidate()
            let alertController = UIAlertController(title: "Time's Up", message: "You didn't pass the quiz.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.navigationController?.popViewController(animated: true)
            }))
            present(alertController, animated: true, completion: nil)
        }
    }
    
    private func updateTimerLabel() {
        let minutes = remainingSeconds / 60
        let seconds = remainingSeconds % 60
        timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
    }
}

extension DesertGameController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DesertGameCell.reuseID, for: indexPath) as? DesertGameCell else {
            fatalError("Could not cast to QuizTestTableViewCell")
        }
        cell.navigationController = self.navigationController
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.setFriendsMode(friendsMode)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

