//
//  SearchTableViewCell.swift
//  NewsToDay
//
//  Created by Владислав on 21.05.2023.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    static let identifier = "SearchTableViewCell"
    
    
    private lazy var searchTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        setupView()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTitleLabel() {
        searchTitleLabel.text = ""
        searchTitleLabel.numberOfLines = 0
        searchTitleLabel.textAlignment = .left
        searchTitleLabel.font = UIFont.interSemiBold14()
        searchTitleLabel.textColor = .blackPrimary
        searchTitleLabel.adjustsFontSizeToFitWidth = true
        searchTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

// MARK: - Set constraints and add Subview
extension SearchTableViewCell {
    
    func setupView() {
      
    }
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([
        

        ])
    }
}
