import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    static var name = ""
    static var email = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
    }
    
    private lazy var profileLabel: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.textColor = .blackPrimary
        label.font = .interSemiBold24()
        return label
    }()
    
    private lazy var profileFotoImageView: UIImageView = {
        let profileFoto = UIImageView()
        profileFoto.image = UIImage(named: "profileFoto")
        profileFoto.contentMode = .scaleToFill
        return profileFoto
    }()
    
//    var names: [String] = ["Ivan Ivanov", "Petr Petrov", "Anton Antonov", "Oleg Olegov"]

      var nameLabel: UILabel = {
        let label = UILabel()
        label.text = name
        label.textColor = .blackPrimary
        label.font = .interRegular16()
        return label
    }()
    
//    var emails: [String] = ["sjdnsdkjcn@gmail.com", "dsnfdjks@gmail.com", "sdjfhbsdjh@gmail.com", "dnkcd@gmail.com"]
    
      var emailLabel: UILabel = {
        let label = UILabel()
        label.text = email
        label.textColor = .greyPrimary
        label.font = .interRegular14()
        return label
    }()
    
    private lazy var languageButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.title = "Language"
        button.configuration?.baseForegroundColor = .greyDark
        button.configuration?.baseBackgroundColor = .greyLighter
        button.configuration?.image = UIImage(named: "forward")
        button.configuration?.imagePadding = 200
        button.configuration?.imagePlacement = .trailing
        button.addTarget(self, action: #selector(languageButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var signOutButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.title = "Sign Out"
        button.configuration?.baseForegroundColor = .greyDark
        button.configuration?.baseBackgroundColor = .greyLighter
        button.configuration?.image = UIImage(named: "signOut")
        button.configuration?.imagePadding = 200
        button.configuration?.imagePlacement = .trailing
        button.addTarget(self, action: #selector(signOutButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var termsAndConditionsButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.title = "Terms & Conditions"
        button.configuration?.baseForegroundColor = .greyDark
        button.configuration?.baseBackgroundColor = .greyLighter
        button.configuration?.image = UIImage(named: "forward")
        button.configuration?.imagePadding = 130
        button.configuration?.imagePlacement = .trailing
        
        button.addTarget(self, action: #selector(termsAndConditionsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.addSubview(profileLabel)
        view.addSubview(profileFotoImageView)
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        view.addSubview(languageButton)
        view.addSubview(termsAndConditionsButton)
        view.addSubview(signOutButton)
    }
    
    @objc func languageButtonTapped() {
        let teamVC = LanguageViewController()
        self.navigationController?.pushViewController(teamVC, animated: true)
    }
    
    @objc func termsAndConditionsButtonTapped() {
        let teamVC = TermsViewController()
        self.navigationController?.pushViewController(teamVC, animated: true)
    }
    
    @objc func signOutButtonTapped() {
        do {
          try Auth.auth().signOut()
        let vc = SingInViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)

        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
    private func setConstraints() {
        
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 72),
            profileLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
        profileFotoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileFotoImageView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 32),
            profileFotoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            profileFotoImageView.widthAnchor.constraint(equalToConstant: 72),
            profileFotoImageView.heightAnchor.constraint(equalToConstant: 72)
        ])
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 44),
            nameLabel.leadingAnchor.constraint(equalTo: profileFotoImageView.trailingAnchor, constant: 24)
        ])
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0),
            emailLabel.leadingAnchor.constraint(equalTo: profileFotoImageView.trailingAnchor, constant: 24)
        ])
        languageButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            languageButton.topAnchor.constraint(equalTo: profileFotoImageView.bottomAnchor, constant: 44),
            languageButton.heightAnchor.constraint(equalToConstant: 56),
            languageButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            languageButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -19)
            ])
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signOutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -28),
            signOutButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            signOutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -19),
            signOutButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        termsAndConditionsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            termsAndConditionsButton.bottomAnchor.constraint(equalTo: signOutButton.topAnchor, constant: -28),
            termsAndConditionsButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            termsAndConditionsButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -19),
            termsAndConditionsButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}
