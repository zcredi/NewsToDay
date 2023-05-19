//
//  AuthViewController.swift
//  NewsToDay
//
//  Created by Sergey Medvedev on 19.05.2023.
//

import UIKit

class SingUpViewController: UIViewController {
    enum Constans {
        static let user = "user"
        static let email = "email"
        static let password = "password"
    }
    // MARK: - titleLabel
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to NewsToDay"
        label.font = .interSemiBold24()
        label.textColor = .blackPrimary
        
        return label
    }()
    // MARK: - subTitleLabel
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, I guess you are new around here. You can start using the application after sign up."
        label.textColor = .greyPrimary
        label.font = .interRegular16()
        label.numberOfLines = 0
        
        return label
    }()
    // MARK: - usernameTextField
    let usernameTextField: UITextField = {
        let textField = UITextField()
        let passwordImageView = UIImageView(image: UIImage(named: Constans.user))
        passwordImageView.contentMode = .scaleAspectFit
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 56, height: 20))
        leftPaddingView.addSubview(passwordImageView)
        passwordImageView.frame = CGRect(x: 18, y: 0, width: 20, height: 20)
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        textField.placeholder = "Username"
        textField.textColor = .greyPrimary
        textField.font = .interMedium16()
        textField.layer.cornerRadius = 12
        textField.backgroundColor = .greyLighter
        
        return textField
    }()
    // MARK: - emailTextField
    let emailTextField: UITextField = {
        let textField = UITextField()
        let emailImageView = UIImageView(image: UIImage(named: Constans.email))
        emailImageView.contentMode = .scaleAspectFit
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 56, height: 16))
        leftPaddingView.addSubview(emailImageView)
        emailImageView.frame = CGRect(x: 18, y: 0, width: 20, height: 16)
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        textField.placeholder = "Email Adress"
        textField.textColor = .greyPrimary
        textField.font = .interMedium16()
        textField.layer.cornerRadius = 12
        textField.backgroundColor = .greyLighter
        
        return textField
    }()
    // MARK: - passwordTextField
    let passwordTextField: UITextField = {
        let textField = UITextField()
        let passwordImageView = UIImageView(image: UIImage(named: Constans.password))
        passwordImageView.contentMode = .scaleAspectFit
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 56, height: 20))
        leftPaddingView.addSubview(passwordImageView)
        passwordImageView.frame = CGRect(x: 18, y: 0, width: 16, height: 20)
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        textField.placeholder = "Password"
        textField.textColor = .greyPrimary
        textField.font = .interMedium16()
        textField.layer.cornerRadius = 12
        textField.backgroundColor = .greyLighter
        
        return textField
    }()
    // MARK: - repeatPasswordTextField
    let repeatPasswordTextField: UITextField = {
        let textField = UITextField()
        let passwordImageView = UIImageView(image: UIImage(named: Constans.password))
        passwordImageView.contentMode = .scaleAspectFit
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 56, height: 20))
        leftPaddingView.addSubview(passwordImageView)
        passwordImageView.frame = CGRect(x: 18, y: 0, width: 16, height: 20)
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        textField.placeholder = "Repeat Password"
        textField.textColor = .greyPrimary
        textField.font = .interMedium16()
        textField.layer.cornerRadius = 12
        textField.backgroundColor = .greyLighter
        
        return textField
    }()
    // MARK: - SingInButsingUpButtonton
    lazy var singUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sing Up", for: .normal)
        button.backgroundColor = .purplePrimary
        button.layer.cornerRadius = 12
        button.tintColor = .white
        button.titleLabel?.font = .interSemiBold16()
        button.addTarget(self, action: #selector(singUpButtonPressed), for: .touchUpInside)
        
        return button
    }()
    // MARK: - textButton
    lazy var textButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Already have an account? Sign In", for: .normal)
        button.titleLabel?.font = .interMedium16()
        button.tintColor = .blackPrimary
        button.addTarget(self, action: #selector(textButtonPressed), for: .touchUpInside)
        
        return button
    }()
    // MARK: - singUpButtonPressed
    @objc private func singUpButtonPressed() {
        let vc = HomepageViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    // MARK: - textButtonPressed
    @objc private func textButtonPressed() {
        let vc = SingInViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstrains()
    }
    // MARK: - setupViews
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(usernameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(repeatPasswordTextField)
        view.addSubview(singUpButton)
        view.addSubview(textButton)
        
    }
    // MARK: - setConstrains
    private func setConstrains() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.top.equalTo(72)
        }
        subTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.top.equalTo(titleLabel.snp.bottom).inset(-8)
            make.trailing.equalTo(-20)
        }
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).inset(-32)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(56)
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).inset(-16)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(56)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).inset(-16)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(56)
        }
        repeatPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).inset(-16)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(56)
        }
        singUpButton.snp.makeConstraints { make in
            make.top.equalTo(repeatPasswordTextField.snp.bottom).offset(16)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(56)
        }
        textButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(29)
            make.centerX.equalToSuperview()
        }
    }
}
