//
//  AI4ViewController.swift
//  AI Finance Mentor
//
//  Created by Ravil on 02.03.2024.
//

import UIKit
import SnapKit

final class DesertHistoryController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let image = UIImageView()
        image.image = UIImage(named: "desertBG")
        view.addSubview(image)
        
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(DesertHistoryCell.self, forCellReuseIdentifier: DesertHistoryCell.desertID)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.rowHeight = 114
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        let imageView = UIImageView(image: UIImage(named: "desertNavHistory"))
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

extension DesertHistoryController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 14
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DesertHistoryCell.desertID, for: indexPath) as? DesertHistoryCell else {
            fatalError("Could not cast to NewsCell")
        }
        let levelIndex = indexPath.row + 1
        if levelIndex == 1 {
            let imageName = "desertCell\(levelIndex)"
            cell.desertHistory.image = UIImage(named: "\(imageName)")
        } else if levelIndex >= 2 && levelIndex <= 14 {
            let imageName = "desertCell\(levelIndex)"
            cell.desertHistory.image = UIImage(named: "\(imageName)")
        } else {
            cell.desertHistory.image = nil

        }
        
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            let detailVC = DesertDetailController()
            detailVC.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(detailVC, animated: true)
        } else {
            let alertController = UIAlertController(title: "Alert", message: "This level history is unavailable", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }
}
