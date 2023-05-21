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
    
    
    public lazy var categoryView: UIView = {
        let view = UIView()
        view.backgroundColor = .greyLighter
        view.layer.cornerRadius = 12
        return view
    }()
    
    public lazy var categoriesLabel = UILabel(text: "", font: .interSemiBold16(), textColor: .blackLight)
    
    
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
       addSubview(categoryView)
        categoryView.addSubview(categoriesLabel)
    }
}

//MARK: - setConstraints()

extension CategoryCollectionViewCell {
    private func setConstraints() {
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            categoryView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            categoryView.heightAnchor.constraint(equalToConstant: 72),
            categoryView.widthAnchor.constraint(equalToConstant: 160),
            categoryView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        categoriesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoriesLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoriesLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
