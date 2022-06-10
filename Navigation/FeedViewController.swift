//
//  FeedViewController.swift
//  Navigation
//
//  Created by Ниночка on 23.04.2022.
//

import UIKit


final class FeedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightText
        view.backgroundColor = .white
        setupLayout()
        setup()
    }

    private func setup() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(buttonOne)
        stackView.addArrangedSubview(buttonTwo)

        NSLayoutConstraint.activate([
            self.stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private let stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 10
        return $0
    }(UIStackView())
    
    private lazy var buttonOne: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Кнопка 1", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(buttonsAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    @objc func buttonsAction(sender: UIButton!) {
        self.navigationController?.pushViewController(PostViewController(), animated: true)
    }
    
    private lazy var buttonTwo: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Кнопка 2", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(buttonsAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private func setupLayout() {
        view.addSubview(stackView)
        [buttonOne, buttonTwo].forEach { stackView.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 110),
            buttonOne.heightAnchor.constraint(equalToConstant: 50),
            buttonTwo.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
    
//    struct Post {
//        let title:String = "Сообщение"
//    }
//
//    private lazy var stackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.backgroundColor = .systemBackground
//        stackView.axis = .vertical
//        stackView.distribution = .fillEqually
//        stackView.spacing = 10
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
//
//    private lazy var oneButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Кнопка на анимацию", for: .normal)
//        button.backgroundColor = .systemBlue
//        button.layer.cornerRadius = 4
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.layer.shadowOffset = CGSize(width: 4, height: 4)
//        button.layer.shadowRadius = 4
//        button.layer.shadowOpacity = 0.7
//        button.addTarget(self, action: #selector(self.buttonOneClicked), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//    private lazy var twoButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Кнопка на алерт", for: .normal)
//        button.backgroundColor = .systemBlue
//        button.layer.cornerRadius = 4
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.layer.shadowOffset = CGSize(width: 4, height: 4)
//        button.layer.shadowRadius = 4
//        button.layer.shadowOpacity = 0.7
//        button.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        view.backgroundColor = .systemBackground
//        title = "Лента"
//        view.addSubview(stackView)
//        stackView.addArrangedSubview(oneButton)
//        stackView.addArrangedSubview(twoButton)
//        NSLayoutConstraint.activate([
//            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
//            stackView.heightAnchor.constraint(equalToConstant: 110)
//        ])
//    }
//
//    @objc func buttonClicked() {
//        let postViewController = PostViewController()
//        navigationController?.pushViewController(postViewController, animated: true)
//        let post = Post()
//        postViewController.title = post.title
//        }
//
//    @objc func buttonOneClicked() {
//        navigationController?.pushViewController(AnimationsViewController(), animated: true)
//        }
//
//}
