//
//  SplashScreenViewController.swift
//  NewsToDay
//
//  Created by Иван Станкин on 13.05.2023.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    private lazy var news: UILabel = {
        let label = UILabel()
        label.text = "News"
        label.font = UIFont(name: "Times New Roman", size: 80)
        label.textColor = .white
        return label
    }()
    
    private lazy var toDay: UILabel = {
        let label = UILabel()
        label.text = "ToDay"
        label.font = UIFont(name: "Times New Roman", size: 80)
        label.textColor = .white
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purpleDark
        
        setupUI()
        setupConstraints()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            let userLogged = UserDefaults.standard.bool(forKey: "userLogged")
            
            if userLogged == true {
                let vc = MainTabBarController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            } else {
                let vc = WelcomeViewController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }
        }
        
    }
    
    private func setupUI() {
        view.addSubview(toDay)
        view.addSubview(news)
        
    }
    
    private func setupConstraints() {
        news.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            news.topAnchor.constraint(equalTo: view.topAnchor, constant: 303),
            news.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 58),
            news.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 131),
            news.heightAnchor.constraint(equalToConstant: 68),
            news.widthAnchor.constraint(equalToConstant: 186)
        ])
        
        toDay.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toDay.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 131),
            toDay.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 58),
            toDay.topAnchor.constraint(equalTo: news.bottomAnchor, constant: 3),
            toDay.heightAnchor.constraint(equalToConstant: 86)
        ])
    }
    
}
