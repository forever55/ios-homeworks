//
//  FeedViewController.swift
//  Navigation
//
//  Created by Alexander on 28.05.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
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

    

