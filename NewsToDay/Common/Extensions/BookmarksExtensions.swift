//
//  BookmarksExtensions.swift
//  NewsToDay
//
//  Created by Александр Вихарев on 12.05.2023.
//


import UIKit


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

