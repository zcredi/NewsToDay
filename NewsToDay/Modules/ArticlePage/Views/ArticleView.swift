//
//  ArticleView.swift
//  NewsToDay
//
//  Created by Sergey Medvedev on 10.05.2023.
//

import UIKit
import SnapKit

class ArticleView: UIView {
    enum Constans {
        static let politic = UIImage(named: "politic")
        static let back = "backButton"
        static let bookmarkNormal = "bookmark"
        static let bookmarkSelected = "bookmark.fill"
        static let share = "share"
    }
    // MARK: - imageView
    let imageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = Constans.politic
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    // MARK: - backgroundView
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.2

        return view
    }()
    // MARK: - backButton
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constans.back), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
    }()
    // MARK: - bookmarkButton
     lazy var bookmarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(systemName: Constans.bookmarkNormal), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(bookmarkButtonPressed), for: .touchUpInside)
        return button
    }()
    // MARK: - shareButton
     lazy var shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: Constans.share), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(shareButtonPressed), for: .touchUpInside)
        return button
    }()
    // MARK: - themeNewsLabel
    let themeNewsLabel: UILabel = {
        let label = UILabel()
        label.text = "Politics"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .interSemiBold12()
        label.backgroundColor = .purplePrimary
        label.layer.cornerRadius = 16
        label.layer.masksToBounds = true
        return label
    }()
    // MARK: - titleLabel
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .interBold20()
        label.textColor = .white
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.16
        label.attributedText = NSMutableAttributedString(string: "The latest situation in the presidential election", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return label
    }()
    // MARK: - nameAutor
    let nameAutor: UILabel = {
        let label = UILabel()
        label.text = "John Doe"
        label.font = .interSemiBold16()
        label.textColor = .white
        return label
    }()
    // MARK: - autor
    let autor: UILabel = {
        let label = UILabel()
        label.text = "Autor"
        label.font = .interRegular14()
        label.textColor = .greyLight
        return label
    }()
    
    // MARK: - scrollView
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    // MARK: - resultsLabel
    let resultsLabel: UILabel = {
        let label = UILabel()
        label.text = "Results"
        label.font = .interSemiBold16()
        label.textColor = .blackPrimary
        return label
    }()
    // MARK: - textLabel
    let textLabel: UILabel = {
        let label = UILabel()
        label.font = .interRegular16()
        label.textColor = .greyDarker
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.24
        label.attributedText = NSMutableAttributedString(string: "Leads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races. For more detailed state results click on the States A-Z links at the bottom of this page. Results source: NEP/Edison via Reuters. Leads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races. For more detailed state results click on the States A-Z links at the bottom of this page. Results source: NEP/Edison via Reuters. Leads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races. For more detailed state results click on the States A-Z links at the bottom of this page. Results source: NEP/Edison via Reuters.", attributes: [NSAttributedString.Key.paragraphStyle : paragraphStyle])
        return label
    }()
    // MARK: - let/var
    var isSelected = false
    var articles = [Article]()
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstrains()
        getApi()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - getApi
    private func getApi() {
        APIManager.shared.getNews() { articles in
            self.articles = articles
            if let url = URL(string: articles[1].urlToImage ?? "") {
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url),
                       let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.imageView.image = image
                        }
                    }
                }
            }
            
            DispatchQueue.main.async {
                self.nameAutor.text = articles[0].author
                self.titleLabel.text = articles[0].title
                self.resultsLabel.text = articles[0].source.name
                self.textLabel.text = articles[0].content
            }
        }
    }
    // MARK: - backButtonPressed
    @objc private func backButtonPressed() {
//        dismiss(animated: true)
        print("backButtonPressed")
    }
    // MARK: - bookmarkButtonPressed
    @objc private func bookmarkButtonPressed(_ sender: UIButton) {
        if isSelected {
            bookmarkButton.setBackgroundImage(UIImage(systemName: Constans.bookmarkNormal), for: .normal)
            isSelected = false
            bookmarkButton.tintColor = .white
        } else {
            bookmarkButton.setBackgroundImage(UIImage(systemName: Constans.bookmarkSelected), for: .normal)
            isSelected = true
            bookmarkButton.tintColor = .red
        }
    }
    // MARK: - shareButtonPressed
    @objc func shareButtonPressed(_ sender: UIButton) {
        let items:[Any] = [URL(string: "https://apple.com")!, UIImage(named: "politic")!]
        let avc = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else { return }
        rootViewController.present(avc, animated: true)
    }
    // MARK: - setupViews
    private func setupViews() {
        
        addSubview(imageView)
        addSubview(backgroundView)
        addSubview(backButton)
        addSubview(bookmarkButton)
        addSubview(shareButton)
        addSubview(themeNewsLabel)
        addSubview(titleLabel)
        addSubview(nameAutor)
        addSubview(autor)
        
        scrollView.addSubview(resultsLabel)
        scrollView.addSubview(textLabel)
        addSubview(scrollView)
    }
    // MARK: - setConstrains
    private func setConstrains() {
        imageView.snp.makeConstraints { make in
            make.trailing.leading.top.equalToSuperview()
            make.height.equalTo(384)
        }
        backgroundView.snp.makeConstraints { make in
            make.edges.equalTo(imageView)
        }
        backButton.snp.makeConstraints { make in
            make.top.equalTo(78)
            make.leading.equalTo(26)
        }
        bookmarkButton.snp.makeConstraints { make in
            make.top.equalTo(74)
            make.trailing.equalTo(-24)
        }
        shareButton.snp.makeConstraints { make in
            make.top.equalTo(bookmarkButton.snp.bottom).inset(-29)
            make.trailing.equalTo(-21)
        }
        themeNewsLabel.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).inset(-79)
            make.leading.equalTo(20)
            make.width.equalTo(75)
            make.height.equalTo(32)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(themeNewsLabel.snp.bottom).inset(-16)
            make.leading.equalTo(20)
            make.trailing.equalTo(-25)
        }
        nameAutor.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-24)
            make.leading.equalTo(26)
        }
        autor.snp.makeConstraints { make in
            make.top.equalTo(nameAutor.snp.bottom).inset(-10)
            make.leading.equalTo(26)
        }
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.leading.equalTo(snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        resultsLabel.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top).inset(24)
            make.leading.equalTo(20)
        }
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(resultsLabel.snp.bottom).inset(-8)
            make.leading.equalTo(scrollView.snp.leading).inset(20)
            make.trailing.equalTo(snp.trailing).inset(20)
            make.bottom.equalTo(scrollView.snp.bottom)
        }
    }
}
