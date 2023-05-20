import UIKit

class LanguageViewController: UIViewController {
    
    private lazy var englishButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.title = "English                                               "
        button.configuration?.baseForegroundColor = .white
        button.configuration?.baseBackgroundColor = .purplePrimary
        button.configuration?.image = UIImage(named: "choice")
        button.configuration?.imagePlacement = .trailing
        button.addTarget(self, action: #selector(englishButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var russianButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.title = "Russian                                                  "
        button.configuration?.baseForegroundColor = .greyDark
        button.configuration?.baseBackgroundColor = .greyLighter
        button.configuration?.imagePlacement = .trailing
        button.addTarget(self, action: #selector(russianButtoTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()        
        view.backgroundColor = .systemBackground
        self.title = "Language"
        setupViews()
        setConstraints()
    }
    
    @objc func englishButtonTapped() {
    }
    
    @objc func russianButtoTapped() {
    }
    
    private func setupViews() {
        view.addSubview(englishButton)
        view.addSubview(russianButton)
    }
    
    private func setConstraints() {
        englishButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            englishButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            englishButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            englishButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -19),
            englishButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        russianButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            russianButton.topAnchor.constraint(equalTo: englishButton.bottomAnchor, constant: 16),
            russianButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            russianButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -19),
            russianButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}
