//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Ниночка on 08.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    private lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Image1")
        image.layer.cornerRadius = 50
        image.clipsToBounds = true
        image.layer.borderWidth = 3.0
        image.layer.borderColor = UIColor.white.cgColor
        return image
    }()


    private lazy var setStatusButton: UIButton = {
        var button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.titleLabel?.textColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4.0
        button.layer.masksToBounds = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    @objc func buttonPressed() {
        print("Waiting for something...")
    }

    private lazy var fullNameLabel: UILabel = {
        var name = UILabel()
        name.text = "Happy animal"
        name.textAlignment = .left
        name.textColor = .black
        name.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()

    private lazy var statusLabel: UILabel = {
        var text = UILabel()
        text.text = "Waiting for something..."
        text.textAlignment = .left
        text.textColor = .gray
        text.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        self.addSubview(avatarImageView)
        self.addSubview(fullNameLabel)
        self.addSubview(setStatusButton)
        self.addSubview(statusLabel)
    
    NSLayoutConstraint.activate([
//        avatarProfile
        self.avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
        self.avatarImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        self.avatarImageView.widthAnchor.constraint(equalToConstant: 100),
        self.avatarImageView.heightAnchor.constraint(equalToConstant: 100),
//        nameProfile
        self.fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
        self.fullNameLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16),
        self.fullNameLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: 0),
//        buttonProfile
        self.setStatusButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16),
        self.setStatusButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 16),
        self.setStatusButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        self.setStatusButton.heightAnchor.constraint(equalToConstant: 50),
//        textProfile
        self.statusLabel.bottomAnchor.constraint(equalTo: self.setStatusButton.topAnchor, constant: -34),
        self.statusLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16),
        self.statusLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: 0),
    ])
    }
}



