//
//  RecommendedView.swift
//  NewsToDay
//
//  Created by Евгений Житников on 12.05.2023.
//

import UIKit

class RecommendedView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Recommended for you"
        label.font = UIFont.interSemiBold20()
        label.textColor = .blackPrimary
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let seeAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("See all", for: .normal)
        button.setTitleColor(.greyPrimary, for: .normal)
        button.titleLabel?.font = UIFont.interMedium14()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        
        addSubview(titleLabel)
        addSubview(seeAllButton)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            seeAllButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            seeAllButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])
    }
}
