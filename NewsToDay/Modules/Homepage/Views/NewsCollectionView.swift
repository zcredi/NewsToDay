//
//  NewsCollectionView.swift
//  NewsToDay
//
//  Created by Евгений Житников on 11.05.2023.
//

import UIKit

protocol NewsCollectionViewDelegate: AnyObject {
    func newsDidSelectItemDelegate(newsItem: Result)
}

class NewsCollectionView: UIView {
    
    var collectionView: UICollectionView!
    let navController = NavController()
    
    var news: [Result] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    weak var delegateNewsCollectionView: NewsCollectionViewDelegate?
    
    var isSearching = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCollection()
        addSubview(collectionView)
        setupConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCollection() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.layer.cornerRadius = 12
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(NewsCell.self, forCellWithReuseIdentifier: NewsCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupConstraints() {
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}

extension NewsCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCell.identifier, for: indexPath) as? NewsCell else {
            return UICollectionViewCell()
        }
        
        cell.configureCell(news[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = news[indexPath.row]
        delegateNewsCollectionView?.newsDidSelectItemDelegate(newsItem: item)
    }
    
}

extension NewsCollectionView: UISearchBarDelegate {

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
                
                    
      var filteredNews = news
                    
        filteredNews = news.filter { result in
                        
            if searchText == "" {
                isSearching = false
                return true
            } else {
                isSearching = true
                return result.title!.lowercased().contains(searchText.lowercased())
            }
        }
        news = filteredNews
        collectionView.reloadData()
    }
}



//self.filteredData.removeAll()
//       guard searchText != "" || searchText != " " else {
//           print("empty search")
//           return
//       }

//       for item in data {
//           let text = searchText.lowercased()
//           let isArrayContain = item.lowercased().range(of: text)
//
//           if isArrayContain != nil {
//               print("Search complete")
//               filteredData.append(item)
//           }
//       }
//
//       print(filteredData)
//
//       if searchBar.text == "" {
//           isSearching = false
//           tableView.reloadData()
//       } else {
//           isSearching = true
//           filteredData = data.filter({$0.contains(searchBar.text ?? "")})
//           tableView.reloadData()
//       }
