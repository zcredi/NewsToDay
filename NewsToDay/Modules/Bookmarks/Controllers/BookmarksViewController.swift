//
//  BookmarksViewController.swift
//  NewsToDay
//
//  Created by Владислав on 08.05.2023.
//

import UIKit



class BookmarksViewController: UIViewController {
    
    var news: [Result] = [NewsToDay.Result(title: Optional("BodyBoost Keto + ACV Gummies [Reviews] – [Truth Exposed 2023] Urgent Warning! What Real Customer Say? Official Website! - mid-day.com"), category: Optional("🫀 Health"), imageURL: Optional("https://images.mid-day.com/images/images/2023/may/BodyBoost-2305_d.jpg"), description: Optional("Overweight issues are the common problems that are being a headache from ancient times."), author: nil), NewsToDay.Result(title: Optional("НА ЖИВО: Локомотив София - Славия 1:1, домакините с човек по-малко - Gong.bg"), category: Optional("🏈 Sports"), imageURL: nil, description: nil, author: Optional("Gong.bg"))] {
        didSet {
            DispatchQueue.main.async {
                print("111")
                self.updateCollectionViewVisibility()
                self.tableSaveContent.reloadData()
                print(self.news)
            }
        }
    }
    
    //MARK: - UI Components
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bookmarks"
        label.textColor = .blackPrimary
        label.font = .interSemiBold24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Saved articles to the library"
        label.textColor = .greyPrimary
        label.font = .interRegular16()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tableSaveContent: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.separatorStyle = .none
        tableView.rowHeight = 114
        tableView.register(ContentCell.self, forCellReuseIdentifier: ContentCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let verStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.spacing = 24
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
        
    }()
    
    let circleView: UIView = {
        let circle = UIView()
        circle.backgroundColor = .purpleLighter
        circle.layer.cornerRadius = 36
        circle.clipsToBounds = true
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
        
    }()
    
    let imageBook: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bookmarks")
        image.frame.size = CGSize(width: 16, height: 20)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let adviceLabel: UILabel = {
        let label = UILabel()
        label.text = "You haven't saved any articles yet. Start reading and bookmarking them now"
        label.textColor = .blackPrimary
        label.font = .interRegular16()
        label.textAlignment = .center
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //MARK: - viewDidLoad
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateCollectionViewVisibility()
        print("VWA--\(self.news)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        tableSaveContent.delegate = self
        tableSaveContent.dataSource = self
        print("VDL--\(self.news)")

    }
    
    func updateCollectionViewVisibility() {
        if news.isEmpty {
            tableSaveContent.isHidden = true
            tableSaveContent.reloadData()
            imageBook.isHidden = false
            circleView.isHidden = false
            adviceLabel.isHidden = false
        } else {
            tableSaveContent.isHidden = false
            tableSaveContent.reloadData()
            imageBook.isHidden = true
            circleView.isHidden = true
            adviceLabel.isHidden = true
        }
    }

    
    //MARK: - Setup UI
    
    private func setupUI() {
        
        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(tableSaveContent)
        view.addSubview(verStack)
        
        view.addSubview(imageBook)
        
        //        verStack.addArrangedSubview(imageBook)
        verStack.addArrangedSubview(circleView)
        verStack.addArrangedSubview(adviceLabel)
        
        //        view.addSubview(circleView)
        
        //        view.addSubview(adviceLabel)
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            tableSaveContent.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,constant: 32),
            tableSaveContent.leadingAnchor.constraint(equalTo: view.leadingAnchor), tableSaveContent.trailingAnchor.constraint(equalTo: view.trailingAnchor), tableSaveContent.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            verStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            verStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 60),
            verStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -60),
        
            circleView.heightAnchor.constraint(equalToConstant: 72),
            circleView.widthAnchor.constraint(equalToConstant: 72),
        
            imageBook.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            imageBook.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),

        ])
        
    }

}




extension BookmarksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(news.count)
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath) as? ContentCell else {
            return UITableViewCell()
        }
        
        cell.configureBookmarks(news[indexPath.row])
        
        return cell
    }
    
}








