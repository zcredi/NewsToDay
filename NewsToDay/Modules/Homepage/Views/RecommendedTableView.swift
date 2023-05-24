//
//  RecommendedTableView.swift
//  NewsToDay
//
//  Created by Евгений Житников on 11.05.2023.
//

import UIKit

protocol RecommendedTableViewDelegate: AnyObject {
    func recommendDidSelectItemDelegate(recommendNews: Recommend)
}

class RecommendedTableView: UIView {
    
    var tableView = UITableView()
    
    var recommendNews: [Recommend] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    weak var delegateRecommendedTableView: RecommendedTableViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTable()
        self.addSubview(tableView)
        setupConstraints()
    }
    
    func configureTable() {
        tableView.rowHeight = 100
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RecommendedCell.self, forCellReuseIdentifier: RecommendedCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupConstraints() {
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecommendedTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recommendNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecommendedCell.identifier, for: indexPath) as? RecommendedCell else {
            return UITableViewCell()
        }
        cell.configureRecommendCell(recommendNews[indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = recommendNews[indexPath.row]
        delegateRecommendedTableView?.recommendDidSelectItemDelegate(recommendNews: item)
    }
}
