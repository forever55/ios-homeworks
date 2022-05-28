//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Александр on 08.05.2022.
//


import UIKit

final class ProfileViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "ArticleCell")
        tableView.backgroundColor = .systemGray6
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        tableView.layer.borderWidth = 0.5
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    } ()
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    
    private let profileHeaderView = ProfileHeaderView()
    
    private let avatarView: AvatarView = {
        let view = AvatarView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupGesture()
    }
    
    private func setupGesture() {
        tapGestureRecognizer.addTarget(self, action: #selector(handleTapGesture(_ :)))
        profileHeaderView.avatarImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer){
        guard self.tapGestureRecognizer === gestureRecognizer else { return }
        UIView.animate(withDuration: 0.5) {
            self.avatarView.alpha = 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        navigationItem.backButtonTitle = "Back"
        self.tableView.reloadData()
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray6
        view.addSubview(tableView)
        view.addSubview(avatarView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            avatarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            avatarView.leftAnchor.constraint(equalTo: view.leftAnchor),
            avatarView.rightAnchor.constraint(equalTo: view.rightAnchor),
            avatarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? PostTableViewCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                return cell
            }
            let viewModel = PostTableViewCell.Model(author: model[indexPath.row - 1].author, image: model[indexPath.row - 1].image, description: model[indexPath.row - 1].description, likes: model[indexPath.row - 1].likes + (model[indexPath.row - 1].liked ? 1 : 0), views: model[indexPath.row - 1].views, liked: model[indexPath.row - 1].liked, number: indexPath.row - 1)
            cell.setup(with: viewModel)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return profileHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.navigationController?.pushViewController(PhotosViewController(), animated: true)
        } else {
            let post = TwoPostViewController()
            post.selectedArticleNumber = indexPath.row - 1
            model[indexPath.row - 1].views += 1
            self.tableView.reloadRows(at: [indexPath], with: .none)
            self.navigationController?.pushViewController(post, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.row != 0 {
            return .delete
        }
        return .none
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            model.remove(at: indexPath.row - 1)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
