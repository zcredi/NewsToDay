//
//  ArticleView.swift
//  NewsToDay
//
//  Created by Sergey Medvedev on 10.05.2023.
//

import UIKit
import SnapKit

class ArticleView: UIView {
    
    private var isLiked: Bool = false
    var result: Result!

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
        imageView.image = Constans.politic
        return imageView
    }()
    
    let backgroundBlackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - backButton
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constans.back), for: .normal)
        button.tintColor = .white
        button.addTarget(nil, action: #selector(ArticlePageViewController.backButtonPressed), for: .touchUpInside)
        return button
    }()
    // MARK: - bookmarkButton
     lazy var bookmarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(systemName: Constans.bookmarkNormal), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
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
        label.numberOfLines = 0
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
        scrollView.showsVerticalScrollIndicator = true
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
        label.numberOfLines = 0
        return label
    }()
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstrains()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - bookmarkButtonPressed
    @objc private func likeButtonTapped() {
        isLiked.toggle()
        let imageName = isLiked ? "bookmark.fill" : "bookmark"
        bookmarkButton.setImage(UIImage(systemName: imageName), for: .normal)
        UserDefaults.standard.saveLikeState(isLiked, for: result.title!)
    }
    
    func updateLikeButtonState() {
        let isLiked = UserDefaults.standard.getLikeState(for: result.title!)
        self.isLiked = isLiked
        let imageName = isLiked ? "bookmark.fill" : "bookmark"
        bookmarkButton.setImage(UIImage(systemName: imageName), for: .normal)
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
        addSubview(backgroundBlackView)
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
        
        backgroundBlackView.snp.makeConstraints { make in
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
            make.top.equalTo(backButton.snp.bottom).inset(-69)
            make.leading.equalTo(20)
            make.width.equalTo(75)
            make.height.equalTo(32)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(themeNewsLabel.snp.bottom).inset(-12)
            make.leading.equalTo(20)
            make.trailing.equalTo(-25)
        }
        nameAutor.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-24)
            make.leading.equalTo(26)
        }
        autor.snp.makeConstraints { make in
            make.top.equalTo(nameAutor.snp.bottom).inset(10)
            make.bottom.equalTo(imageView.snp.bottom).inset(16)
            make.leading.equalTo(26)
        }
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        resultsLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).inset(-10)
            make.leading.equalTo(20)
        }
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(resultsLabel.snp.bottom).inset(-8)
            make.leading.equalTo(snp.leading).inset(20)
            make.trailing.equalTo(snp.trailing).inset(10)
            make.bottom.equalTo(scrollView.snp.bottom)
        }
    }
}
