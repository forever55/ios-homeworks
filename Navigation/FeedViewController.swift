//
//  FeedViewController.swift
//  Navigation
//
//  Created by Alexander on 23.04.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .darkGray
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 10
        stack.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    private let buttonOne: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 60))
        button.setTitle("Кнопка 1", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(buttonsAction), for: .touchUpInside)
        return button
    }()
    
    private let buttonTwo: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 60))
        button.setTitle("Кнопка 2", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(buttonsAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Моя страница"
        self.view.backgroundColor = .lightText
        
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
    
    @objc func buttonsAction() {
        let postView = PostViewController()
        navigationController?.pushViewController(postView, animated: true)
    }
}

    

