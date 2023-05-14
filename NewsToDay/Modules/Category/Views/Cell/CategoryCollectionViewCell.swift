//
//  CategoryCollectionViewCell.swift
//  NewsToDay
//
//  Created by Владислав on 09.05.2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    enum Constants {
        
    }
    
    //MARK: - Create UI
    
    private lazy var categoryButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .greyLighter
        button.setTitle("🏈 Sports", for: .normal)
        button.setTitleColor(.greyDark, for: .normal)
        button.titleLabel?.font = .interSemiBold16()
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(categoryButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
       addSubview(categoryButton)
    }
    
    @objc
    private func categoryButtonTapped() {
        print("Sports")
    }
}

//MARK: - setConstraints()

extension CategoryCollectionViewCell {
    private func setConstraints() {
        categoryButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryButton.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            categoryButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            categoryButton.heightAnchor.constraint(equalToConstant: 72),
            categoryButton.widthAnchor.constraint(equalToConstant: 160),
            categoryButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
