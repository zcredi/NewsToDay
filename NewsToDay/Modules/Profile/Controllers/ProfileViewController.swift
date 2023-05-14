//
//  ProfileViewController.swift
//  NewsToDay
//
//  Created by Владислав on 08.05.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    let profileTitle = UILabel()
    let profileFotoView = UIImageView(image: UIImage(named: "profileFoto"))
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let languageButton = UIButton(type: .system)
    let termsAndConditionsButton = UIButton(type: .system)
    let signOutButton = UIButton(type: .system)
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        setupProfileTitle()
        setupProfileFotoView()
        setupNameLabel()
        //setupEmailLabel()
        setupLanguageButton()
        setupsignOutButton()
        setupTermsAndConditionsButton()
    }
    
    func setupProfileTitle() {
        view.addSubview(profileTitle)
        profileTitle.translatesAutoresizingMaskIntoConstraints = false
        profileTitle.text = "Profile"
        profileTitle.textColor = .blackPrimary
        profileTitle.font = .interBold24()
        NSLayoutConstraint.activate([
            profileTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 72),
            profileTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
            
        ])
    }
    
    func setupProfileFotoView() {
        view.addSubview(profileFotoView)
        profileFotoView.translatesAutoresizingMaskIntoConstraints = false
        profileFotoView.contentMode = .scaleToFill
        NSLayoutConstraint.activate([
            profileFotoView.topAnchor.constraint(equalTo: profileTitle.bottomAnchor, constant: 32),
            profileFotoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            profileFotoView.widthAnchor.constraint(equalToConstant: 72),
            profileTitle.heightAnchor.constraint(equalToConstant: 72)
        ])
    }
    
    func setupNameLabel() {
        view.addSubview(nameLabel)
        nameLabel.text = "Dev P"
        nameLabel.textColor = .blackPrimary
        nameLabel.font = .interBold16()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: profileTitle.bottomAnchor, constant: 44),
            nameLabel.leadingAnchor.constraint(equalTo: profileFotoView.trailingAnchor, constant: 24)
        ])
    }
    
    func setupEmailLabel() {
        view.addSubview(emailLabel)
        nameLabel.text = "dev@gmail.com"
        nameLabel.textColor = .greyPrimary
        emailLabel.font = .interRegular16()
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0),
            emailLabel.leadingAnchor.constraint(equalTo: profileFotoView.trailingAnchor, constant: 24)
        ])
    }
    
    func setupLanguageButton() {
        view.addSubview(languageButton)
        languageButton.layer.cornerRadius = 12
        languageButton.backgroundColor = .greyLighter
        languageButton.setTitle("Language", for: .normal)
        languageButton.setTitleColor(.greyDark, for: .normal)
        languageButton.titleLabel?.font = .interSemiBold16()
        languageButton.translatesAutoresizingMaskIntoConstraints = false
        languageButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            languageButton.topAnchor.constraint(equalTo: profileFotoView.bottomAnchor, constant: 44),
            languageButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            languageButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -19),
            languageButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    @objc func buttonTapped() {
            let LanguageViewController = LanguageViewController() // Создаем экземпляр ViewControllerB
            navigationController?.pushViewController(LanguageViewController, animated: true) // Вызываем переход
        }
    
    func setupTermsAndConditionsButton() {
        view.addSubview(termsAndConditionsButton)
        termsAndConditionsButton.layer.cornerRadius = 12
        termsAndConditionsButton.backgroundColor = .greyLighter
        termsAndConditionsButton.setTitle("Terms & Conditions", for: .normal)
        termsAndConditionsButton.setTitleColor(.greyDark, for: .normal)
        termsAndConditionsButton.titleLabel?.font = .interSemiBold16()
        termsAndConditionsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            termsAndConditionsButton.bottomAnchor.constraint(equalTo: signOutButton.topAnchor, constant: -28),
            termsAndConditionsButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            termsAndConditionsButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -19),
            termsAndConditionsButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    func setupsignOutButton() {
        view.addSubview(signOutButton)
        signOutButton.layer.cornerRadius = 12
        signOutButton.backgroundColor = .greyLighter
        signOutButton.setTitle("Sign Out", for: .normal)
        signOutButton.setTitleColor(.greyDark, for: .normal)
        signOutButton.titleLabel?.font = .interSemiBold16()
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signOutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -28),
            signOutButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            signOutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -19),
            signOutButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}
