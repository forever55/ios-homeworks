//
//  ViewController.swift
//  Navigation
//
//  Created by Alexander on 23.04.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        makeButton()
    }

    private func makeButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.center = view.center
        button.setTitle("Пуск", for: .normal)
        button.backgroundColor = .magenta
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func tapAction() {
        let vc = FeedViewController()
//        vc.post = .none
        present(vc, animated: true)
    }

}

