//
//  PostViewController.swift
//  Navigation
//
//  Created by Ниночка on 14.05.2022.
//

import UIKit



class PostViewController: UIViewController {

    var post: String = "Моя страница"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = post
        self.view.backgroundColor = .systemGray
        postProfile()
        barItem()
    }
    
    private func postProfile() {
        let textPost = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 700))
        textPost.numberOfLines = 20
        textPost.center = view.center
        textPost.text = "Человек прежде всего должен определить себя в более менее конкретных категориях. Он должен спросить себя: кто я – трус или более менее не трус? Я добрый человек? Или я жадный человек? Я честен с бабами, допустим, или я не очень. Вот эти дела. То есть он сначала на эти вопросы должен себе внятно ответить. И только потом он должен себя начать определять в категориях национальности, культуры, географии, философии, религии и т. д. Потому что все эти большие дела, они очень сильно замутняют. И ты думаешь: если ты читал этого самого Гегеля, или Бердяева, я не знаю, то ты уже хороший. —  Иосиф Александрович Бродский"
        view.addSubview(textPost)
        
    }
    
    private func barItem() {
        let barItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(buttonAction))
        self.navigationItem.title = post
        navigationItem.rightBarButtonItem = barItem
    }
    
    @objc private func buttonAction() {
        let infoView = InfoViewController()
        navigationController?.pushViewController(infoView, animated: true)
    }
}

        
