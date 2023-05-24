//
//  ContentCell.swift
//  NewsToDay
//
//  Created by Александр Вихарев on 10.05.2023.
//

import UIKit

class ContentCell: UITableViewCell {
    
    static let identifier = "ContentCell"
    
    private let contentImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .purplePrimary
        image.clipsToBounds = true
        image.layer.cornerRadius = 12
        image.tintColor = .label
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let contentTitle: UILabel = {
        let label = UILabel()
        label.text = "UI/UX Design"
        label.textColor = .greyPrimary
        label.font = .interRegular14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let contentSubTitle: UILabel = {
        let label = UILabel()
        label.text = "A Simple Trick For Creating Color Palettes Quickly"
        label.numberOfLines = 2
        label.textColor = .blackPrimary
        label.font = .interSemiBold16()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let verStack: UIStackView = {
        let subStack = UIStackView()
        subStack.axis = .vertical
        subStack.alignment = .leading
        subStack.distribution = .equalSpacing
        subStack.spacing = 8
        subStack.translatesAutoresizingMaskIntoConstraints = false
        return subStack
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI(){
        contentView.addSubview(contentImage)
        contentView.addSubview(verStack)
        verStack.addArrangedSubview(contentTitle)
        verStack.addArrangedSubview(contentSubTitle)
        
        
        
        NSLayoutConstraint.activate([
            
            contentImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            contentImage.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            contentImage.heightAnchor.constraint(equalToConstant: 96),
            contentImage.widthAnchor.constraint(equalToConstant: 96),
            
            
            verStack.topAnchor.constraint(equalTo: contentImage.topAnchor, constant: 8),
            verStack.leadingAnchor.constraint(equalTo: contentImage.trailingAnchor, constant: 10),
            verStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            
        ])
        
    }
}

