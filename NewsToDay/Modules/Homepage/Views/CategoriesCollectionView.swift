//
//  CategoriesCollectionView.swift
//  NewsToDay
//
//  Created by Владислав on 08.05.2023.
//

import UIKit

protocol CollectionDidSelectProtocol: AnyObject {
    func getNewsFromCategory(categoryName: String)
}

class CategoriesCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var collectionView: UICollectionView!
    weak var delegateCollectionDidSelect: CollectionDidSelectProtocol?
    
    private var categories: [String] = {
        var category = ["Random"]
        category.append(contentsOf: Category.allCases.map( { $0.rawValue }))
        return category
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCollection()
        setCollectionDelegates()
        addSubview(collectionView)
        setupConstraints()
        makeFirstCellActive()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCollection() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
    }
    
    private func setCollectionDelegates() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupConstraints() {
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func makeFirstCellActive() {
        let firstIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: firstIndexPath, animated: false, scrollPosition: .centeredHorizontally)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as? CategoryCell else {
            return UICollectionViewCell()
        }

        
        switch categories[indexPath.item] {
        case "general":
            cell.categoryLabel.text = "🔥 General"
        case "health":
            cell.categoryLabel.text = "🫀 Health"
        case "business":
            cell.categoryLabel.text = "💼 Business"
        case "technology":
            cell.categoryLabel.text = "👨‍💻 Technology"
        case "science":
            cell.categoryLabel.text = "🔬 Science"
        case "entertainment":
            cell.categoryLabel.text = "🎮 Gaming"
        case "sports":
            cell.categoryLabel.text = "🏈 Sports"
        default:
            cell.categoryLabel.text = "Random"
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = categories[indexPath.row]
        let cellWidth = text.size(withAttributes: [.font: UIFont.systemFont(ofSize: 16)]).width + 40
        return CGSize(width: cellWidth, height: 36)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var category = categories[indexPath.item]
        if category == "Random" {
            category = categories.randomElement() ?? "Random"
        }
        delegateCollectionDidSelect?.getNewsFromCategory(categoryName: category)
    }
}
