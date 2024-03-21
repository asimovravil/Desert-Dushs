//
//  AI4DetailViewController.swift
//  AI Finance Mentor
//
//  Created by Ravil on 02.03.2024.
//

import UIKit
import SnapKit

final class DesertDetailController: UIViewController {
    
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
        
        let titleText = UILabel()
        titleText.text = "Welcome to the first day of our journey into the captivating world of sweets. Today, we embark on a voyage through time, exploring the ancient origins and early evolution of confectionery delights that have enchanted civilizations for centuries. \n\nIntroduction to Day 1: In the annals of human history, sweetness has held a special place in the hearts and minds of people across cultures and epochs. Our fascination with the delectable allure of sweets traces back to the dawn of civilization itself, where the pursuit of sugary indulgence began as a quest for natural sweetness. \n\nThe Cradle of Sweetness: Our journey commences in the ancient civilizations of Mesopotamia and Egypt, where the earliest traces of sweet indulgence can be found. In these ancient lands, honey emerged as the first natural sweetener, revered for its divine taste and perceived medicinal properties. The ancient Egyptians, in particular, cherished honey as a precious gift from the gods and used it not only as a sweetener but also in religious ceremonies and embalming rituals. \n\nThe Spice Routes and the Birth of Confectionery: As trade routes expanded and civilizations interconnected, the exchange of goods and ideas ushered in a new era of confectionery. The spice trade routes of the ancient world became conduits for the dissemination of exotic flavors and culinary techniques. Spices such as cinnamon, cloves, and nutmeg found their way into the kitchens of ancient Rome, Greece, and Persia, where they were combined with honey and nuts to create early forms of confectionery. \n\nThe Sweet Symphonies of the Mediterranean: In the Mediterranean world, the Greeks and Romans elevated the art of confectionery to new heights, introducing innovations such as candied fruits, pastries, and early versions of nougat and marzipan. These delectable creations adorned banquet tables, graced festive celebrations, and became symbols of wealth and social status. \n\nThe Sweet Influence of the East: As empires rose and fell, the allure of sweetness continued to spread eastward, carried by the winds of trade and cultural exchange. In the medieval courts of the Middle East and Persia, master confectioners perfected the craft of sugar confectionery, creating intricate designs and exquisite delicacies that delighted the senses and captivated the imagination. \n\nConclusion of Day 1: As we conclude our exploration of the ancient origins of sweetness, we are reminded of the enduring legacy of confectionery—a testament to the human quest for pleasure, creativity, and cultural expression. Join us tomorrow as we delve deeper into the rich tapestry of sweet history, uncovering new treasures and untold stories along the way. \n\nStay tuned for Day 2: The Age of Exploration and the Globalization of Sweetness."
        titleText.textColor = .white
        titleText.font = UIFont(name: "DMSans-Regular", size: 16)
        titleText.textAlignment = .left
        titleText.numberOfLines = 0
        containerView.addSubview(titleText)
        
        titleText.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top).offset(32)
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalTo(scrollView.snp.bottom)
        }
        
        let imageView = UIImageView(image: UIImage(named: "desrtNavDay1"))
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

