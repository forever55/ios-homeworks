//
//  TwoProfileViewController.swift
//  Navigation
//
//  Created by Ниночка on 14.05.2022.
//

import UIKit

class TwoProfileViewController: UIViewController {

    private let profileHeaderView: UIView = {
        let profile = ProfileHeaderView()
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.backgroundColor = .darkGray
        return profile
    }()
    
    private let newButton: UIButton = {
        let buttonNew = UIButton()
        var button = UIButton()
        button.setTitle("Пуск", for: .normal)
        button.titleLabel?.textColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4.0
        button.layer.masksToBounds = false
        button.addTarget(self, action: #selector(startButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func startButton(sender: UIButton){
        print(#function)
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {

        self.view.backgroundColor = .lightGray
        self.navigationItem.title = "Профиль"
        self.view.addSubview(profileHeaderView)
        self.view.addSubview(newButton)
       
        NSLayoutConstraint.activate([
            self.profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            self.profileHeaderView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            self.profileHeaderView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            self.profileHeaderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -220),
            self.newButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0),
            self.newButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            self.newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            self.newButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
