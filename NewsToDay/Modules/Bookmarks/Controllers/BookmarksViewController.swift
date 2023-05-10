//
//  BookmarksViewController.swift
//  NewsToDay
//
//  Created by Владислав on 08.05.2023.
//

import UIKit

class BookmarksViewController: UIViewController {
   
    
    
  
    //MARK: - UI Components
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bookmarks"
        label.textColor = .black //TODO: заменить цвет после объединения веток
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium) //TODO: заменить шрифт после объединения веток
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Saved articles to the library"
        label.textColor = .gray //TODO: заменить цвет после объединения веток
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium) //TODO: заменить шрифт после объединения веток
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tableSaveContent: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground //TODO: заменить цвет после объединения веток
        tableView.allowsSelection = true
        tableView.separatorStyle = .none
        tableView.rowHeight = 114
        tableView.register(ContentCell.self, forCellReuseIdentifier: ContentCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        tableSaveContent.delegate = self
        tableSaveContent.dataSource = self
        
  
    }
    //MARK: - Setup UI
    
    private func setupUI() {
        
        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(tableSaveContent)
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 72),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            tableSaveContent.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,constant: 32),
            tableSaveContent.leadingAnchor.constraint(equalTo: view.leadingAnchor), tableSaveContent.trailingAnchor.constraint(equalTo: view.trailingAnchor), tableSaveContent.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
        
        
    }
    
    

}


extension BookmarksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath) as? ContentCell else {
            fatalError("")
        }
        
        return cell
    }
        
      


    
}
