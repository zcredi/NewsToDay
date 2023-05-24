//
//  CategoryCell.swift
//  NewsToDay
//
//  Created by Евгений Житников on 11.05.2023.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static let identifier = "CategoryCell"
    
    let categoryLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.textAlignment = .center
        view.textColor = UIColor.greyPrimary
        view.font = UIFont.interSemiBold12()
        return view
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                backgroundColor = UIColor.purplePrimary
                categoryLabel.textColor = .white
                layer.borderColor = UIColor.purplePrimary.cgColor
                
            } else {
                backgroundColor = UIColor.greyLighter
                categoryLabel.textColor = UIColor.greyPrimary
                layer.borderColor = UIColor.greyLighter.cgColor
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        setupUICell()
    }
    
    func setupUICell() {
        backgroundColor = UIColor.greyLighter
        layer.borderWidth = 1
        layer.borderColor = UIColor.greyLighter.cgColor
        layer.masksToBounds = false
        layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with title: String) {
        categoryLabel.text = title
    }
    
    private func setupViews() {
        contentView.addSubview(categoryLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}


struct ListItem {
    let title: String
    let category: String
    let image: String
}

