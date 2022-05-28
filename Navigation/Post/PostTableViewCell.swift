//
//  File.swift
//  Navigation
//
//  Created by Ниночка on 17.05.2022.
//

import UIKit


final class PostTableViewCell: UITableViewCell {
    
    struct Model {
        let author: String
        let image: String
        let description: String
        var likes: Int
        var views: Int
        var liked: Bool
        var number: Int
    }
    
    private lazy var viewBack: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()
    
    private lazy var viewStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    } ()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    } ()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = NSTextAlignment.left
        label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private lazy var viewImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.setContentCompressionResistancePriority(UILayoutPriority(100), for: .vertical)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "Sistem", size: 14)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont(name: "Sistem", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapLiked))
        label.addGestureRecognizer(tap)
        label.isUserInteractionEnabled = true
        return label
    } ()

    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont(name: "Sistem", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private lazy var liked: Bool = false
    private lazy var likesCount: Int = 0
    private lazy var number: Int = 0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.authorLabel.text = nil
        self.viewImage.image = nil
        self.descriptionLabel.text = nil
        self.likesLabel.text = nil
        self.viewsLabel.text = nil
    }
    
    private func setupView() {
        contentView.backgroundColor = .white
        contentView.addSubview(viewBack)
        viewBack.addSubview(viewStack)
        viewStack.addArrangedSubview(authorLabel)
        viewStack.addArrangedSubview(viewImage)
        viewStack.addArrangedSubview(descriptionLabel)
        viewStack.addArrangedSubview(stackView)
        stackView.addArrangedSubview(likesLabel)
        stackView.addArrangedSubview(viewsLabel)
        backViewConstraints()
        stackViewPostConstraints()
    }
    
    private func backViewConstraints() {
        NSLayoutConstraint.activate([
            viewBack.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewBack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewBack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            viewBack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func stackViewPostConstraints() {
        NSLayoutConstraint.activate([
            viewStack.topAnchor.constraint(equalTo: viewBack.topAnchor, constant: 10),
            viewStack.leadingAnchor.constraint(equalTo: viewBack.leadingAnchor, constant: 16),
            viewStack.trailingAnchor.constraint(equalTo: viewBack.trailingAnchor, constant: -16),
            viewStack.bottomAnchor.constraint(equalTo: viewBack.bottomAnchor, constant: -10)
        ])
    }

    func setup(with viewModel: Model) {
        self.authorLabel.text = viewModel.author
        self.viewImage.image = UIImage(named: viewModel.image)
        self.descriptionLabel.text = viewModel.description
        self.likesLabel.text = "Likes: " + String(viewModel.likes)
        self.viewsLabel.text = "Views: " + String(viewModel.views)
        self.liked = viewModel.liked
        self.likesCount = viewModel.likes
        self.number = viewModel.number
    }
    
    @objc func tapLiked() {
        if number < model.count {
            if authorLabel.text == model[number].author && descriptionLabel.text == model[number].description {
                liked.toggle()
                model[number].liked = liked
                likesLabel.text = "Likes: \(model[number].likes + (model[number].liked ? 1 : 0))"
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
