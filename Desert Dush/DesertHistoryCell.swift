//
//  AI4Cell.swift
//  AI Finance Mentor
//
//  Created by Ravil on 02.03.2024.
//

import UIKit
import SnapKit

final class DesertHistoryCell: UITableViewCell {

    static let desertID = String(describing: DesertHistoryCell.self)
    
    public let desertHistory = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        contentView.addSubview(desertHistory)
        
        desertHistory.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

