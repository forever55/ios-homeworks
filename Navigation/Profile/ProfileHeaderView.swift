//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Александр on 08.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    private lazy var avatarProfile: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Image1")
        image.layer.cornerRadius = 50
        image.clipsToBounds = true
        image.layer.borderWidth = 3.0
        image.layer.borderColor = UIColor.white.cgColor
        return image
    }()


    private lazy var buttonProfile: UIButton = {
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

    private lazy var nameProfile: UILabel = {
        var name = UILabel()
        name.text = "Happy animal"
        name.textAlignment = .left
        name.textColor = .black
        name.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()

    private lazy var textProfile: UILabel = {
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
        self.addSubview(avatarProfile)
        self.addSubview(nameProfile)
        self.addSubview(buttonProfile)
        self.addSubview(textProfile)
    
    NSLayoutConstraint.activate([
//        avatarProfile
        self.avatarProfile.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
        self.avatarProfile.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        self.avatarProfile.widthAnchor.constraint(equalToConstant: 100),
        self.avatarProfile.heightAnchor.constraint(equalToConstant: 100),
//        nameProfile
        self.nameProfile.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
        self.nameProfile.leadingAnchor.constraint(equalTo: self.avatarProfile.trailingAnchor, constant: 16),
        self.nameProfile.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: 0),
//        buttonProfile
        self.buttonProfile.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16),
        self.buttonProfile.topAnchor.constraint(equalTo: self.avatarProfile.bottomAnchor, constant: 16),
        self.buttonProfile.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        self.buttonProfile.heightAnchor.constraint(equalToConstant: 50),
//        textProfile
        self.textProfile.bottomAnchor.constraint(equalTo: self.buttonProfile.topAnchor, constant: -34),
        self.textProfile.leadingAnchor.constraint(equalTo: self.avatarProfile.trailingAnchor, constant: 16),
        self.textProfile.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: 0),
    ])
    }
}



