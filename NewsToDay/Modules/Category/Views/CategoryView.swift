//
//  CategoryView.swift
//  NewsToDay
//
//  Created by Владислав on 09.05.2023.
//

import UIKit

class CategoryView: UIView {
    enum Constants {
        static let idCategoryCell: String = "idCategoryCell"
        static let collectionViewTopSpacing: CGFloat = 0.0
        static let collectionViewBottomSpacing: CGFloat = 30.0
        static let collectionViewLeadingSpacing: CGFloat = 0.0
        static let collectionViewTrailingSpacing: CGFloat = 0.0
    }
    
    //MARK: - Create UI
    
    private lazy var categories: [Category] = []
    
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: Constants.idCategoryCell)
        
        APIManager.shared.getCategory { [weak self] values in
            DispatchQueue.main.async {
                guard let self else { return }
                self.categories = values
                self.collectionView.reloadData()
            }
        }
        
        setupViews()
        setConstraints()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupViews() {
        layer.cornerRadius = 12
        addSubview(collectionView)
        collectionView.showsVerticalScrollIndicator = true
    }

}

//MARK: - setConstraints()

extension CategoryView {
    private func setConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.collectionViewTopSpacing),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.collectionViewBottomSpacing),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.collectionViewTrailingSpacing),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.collectionViewLeadingSpacing)
        ])
    }
}

//MARK: - UICollectionViewDataSource

extension CategoryView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.idCategoryCell, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
        
        switch categories[indexPath.item] {
        case .general:
                cell.categoryButton.setTitle("🔥 General", for: .normal)
        case .health:
                cell.categoryButton.setTitle("🫀 Health", for: .normal)
        case .business:
                cell.categoryButton.setTitle("💼 Business", for: .normal)
        case .technology:
            cell.categoryButton.setTitle("👨‍💻 Technology", for: .normal)
        case .science:
            cell.categoryButton.setTitle("🔬 Science", for: .normal)
        case .entertainment:
            cell.categoryButton.setTitle("🎮 Gaming", for: .normal)
        case .sports:
            cell.categoryButton.setTitle("🏈 Sports", for: .normal)
            }
        
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension CategoryView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - collectionView.contentInset.left - collectionView.contentInset.right - Constants.collectionViewTopSpacing) / 2
        let height = collectionView.frame.height / 10
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        Constants.collectionViewTopSpacing
        }
    }

//MARK: - UICollectionViewDelegate

extension CategoryView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print(indexPath)
    }
}
