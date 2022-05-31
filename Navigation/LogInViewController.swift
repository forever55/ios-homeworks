//
//  LogInViewController.swift
//  Navigation
//
//  Created by Ниночка on 15.05.2022.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {

    let nc = NotificationCenter.default
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        return $0
    }(UIView())
    
    private let imageLog: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo.png")
        return image
    }()
    
    private let stackViewTextFieldVertical: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var loginTextField: UITextField = {
        let loginText = UITextField()
        loginText.delegate = self
        loginText.backgroundColor = .systemGray6
        loginText.textColor = .black
        loginText.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        loginText.autocapitalizationType = .none
        loginText.translatesAutoresizingMaskIntoConstraints = false
        loginText.layer.borderColor = UIColor.lightGray.cgColor
        loginText.layer.borderWidth = 0.5
        loginText.layer.cornerRadius = 10
        loginText.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        loginText.placeholder = "Email or phone"
        loginText.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: loginText.frame.height))
        loginText.leftViewMode = .always
        return loginText
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordText = UITextField()
        passwordText.delegate = self
        passwordText.backgroundColor = .systemGray6
        passwordText.textColor = .black
        passwordText.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordText.isSecureTextEntry = true
        passwordText.autocapitalizationType = .none
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        passwordText.layer.borderColor = UIColor.lightGray.cgColor
        passwordText.layer.borderWidth = 0.5
        passwordText.layer.cornerRadius = 10
        passwordText.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        passwordText.placeholder = "Password"
        passwordText.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordText.frame.height))
        passwordText.leftViewMode = .always
        return passwordText
    }()
    
    private let logInBottom: UIButton = {
        var bottom = UIButton()
        bottom.setTitle("Log In", for: .normal)
        bottom.titleLabel?.textColor = .white
        bottom.translatesAutoresizingMaskIntoConstraints = false
        bottom.backgroundColor = UIColor(named: "ColorVK")
        bottom.layer.cornerRadius = 10
        bottom.addTarget(self, action: #selector(auth), for: .touchUpInside)
        return bottom
    }()
    
    @objc private func auth(sender: UIButton){
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nc.addObserver(self, selector: #selector(keybordShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(keybordHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func configure() {
        self.view.backgroundColor = .white
        self.hideKeyboardWhenTappedAround()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func layout() {
        let inset: CGFloat = 16
        view.addSubview(scrollView)
        
        [loginTextField, passwordTextField].forEach { stackViewTextFieldVertical.addArrangedSubview($0)}
        [imageLog, stackViewTextFieldVertical, logInBottom].forEach { contentView.addSubview($0) }
        
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
           
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            imageLog.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageLog.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            imageLog.widthAnchor.constraint(equalToConstant: 100),
            imageLog.heightAnchor.constraint(equalToConstant: 100),
            stackViewTextFieldVertical.topAnchor.constraint(equalTo: imageLog.bottomAnchor, constant: 120),
            stackViewTextFieldVertical.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            stackViewTextFieldVertical.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            stackViewTextFieldVertical.heightAnchor.constraint(equalToConstant: 100),
            logInBottom.heightAnchor.constraint(equalToConstant: 50),
            logInBottom.topAnchor.constraint(equalTo: stackViewTextFieldVertical.bottomAnchor, constant: inset),
            logInBottom.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            logInBottom.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            logInBottom.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)
        ])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

extension LogInViewController {
    @objc private func keybordShow(notification: NSNotification){
        if let keybordSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keybordSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keybordSize.height, right: 0)
        }
    }
    
    @objc private func keybordHide() {
        self.scrollView.contentInset = .zero
        self.scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

