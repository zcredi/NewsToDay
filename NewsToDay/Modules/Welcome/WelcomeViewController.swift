//
//  WelcomeViewController.swift
//  NewsToDay
//
//  Created by Иван Станкин on 10.05.2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var pageNumber = 1
    
    var imageArray = [UIImage(named: "welcomeImage_1.png"), UIImage(named: "welcomeImage_2.png"), UIImage(named: "welcomeImage_3.png")]
    
    var firstTitleArray = ["All news in one place", "Read only what You want", "Don't lose what's useful!"]
    
    var secondTitleArray = ["News from all over the world at your fingertips. Everyday. Anytime.", "Choose categories and get news only on topics that interesting for you", "Bookmark interesting, informative or intriguing news!"]
    
    private lazy var welcomeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = imageArray[0]
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    
    private lazy var pageController: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .greyLighter
        pageControl.currentPageIndicatorTintColor = .purplePrimary
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    
    private lazy var upperLabel: UILabel = {
        let label = UILabel()
        label.text = firstTitleArray[0]
        label.font = .interBold16()
        label.textColor = .black
        return label
    }()
    
    private lazy var bottomLabel: UILabel = {
        let label = UILabel()
        label.text = secondTitleArray[0]
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .interMedium16()
        label.textColor = .black
        return label
    }()
    
    private lazy var firstButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = .interRegular16()
        button.backgroundColor = .purplePrimary
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.tintColor = .purplePrimary
        button.addTarget(self, action: #selector(firstButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        
    }
    
    @objc func firstButtonTapped() {
        
        switch pageNumber {

        case 1:
            welcomeImageView.image = imageArray[pageNumber]
            upperLabel.text = firstTitleArray[pageNumber]
            bottomLabel.text = secondTitleArray[pageNumber]
            pageController.currentPage = pageNumber
            pageNumber += 1
        case 2:
            welcomeImageView.image = imageArray[pageNumber]
            upperLabel.text = firstTitleArray[pageNumber]
            bottomLabel.text = secondTitleArray[pageNumber]
            pageController.currentPage = pageNumber
            firstButton.setTitle("Get started", for: .normal)
            pageNumber += 1
        default:
            UserDefaults.standard.set(true, forKey: "userLogged")
            let vc = MainTabBarController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            
        }
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(firstButton)
        view.addSubview(bottomLabel)
        view.addSubview(upperLabel)
        view.addSubview(pageController)
        view.addSubview(welcomeImageView)
        
    }
    
    private func setConstraints() {
        
        welcomeImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            welcomeImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            welcomeImageView.heightAnchor.constraint(equalToConstant: 336),
            welcomeImageView.widthAnchor.constraint(equalToConstant: 288),
            welcomeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        pageController.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageController.topAnchor.constraint(equalTo: welcomeImageView.bottomAnchor, constant: 40),
            pageController.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        upperLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            upperLabel.topAnchor.constraint(equalTo: pageController.bottomAnchor, constant: 34),
            upperLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
//            bottomLabel.heightAnchor.constraint(equalToConstant: 48),
            bottomLabel.widthAnchor.constraint(equalToConstant: 216),
            bottomLabel.topAnchor.constraint(equalTo: upperLabel.bottomAnchor, constant: 24),
            bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            firstButton.heightAnchor.constraint(equalToConstant: 56),
            firstButton.widthAnchor.constraint(equalToConstant: 336)
        ])
    }
}
