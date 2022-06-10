//
//  InfoViewController.swift
//  Navigation
//
//  Created by Ниночка on 19.05.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        self.navigationItem.title = "Info"
        button()
    }
    
    private func button() {
        let alertButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        alertButton.center = view.center
        alertButton.setTitle("Изменить", for: .normal)
        alertButton.backgroundColor = .link
        alertButton.layer.cornerRadius = 4
        alertButton.addTarget(self, action: #selector(alertAction), for: .touchUpInside)
        view.addSubview(alertButton)
    }
    
    @objc private func alertAction () {
        let alert = UIAlertController(title: "Данные изменены", message: "Сохранить изменения?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Да", style: .default) {_ in
            print("Изменения сохранены")
            self.navigationController?.popViewController(animated: true)
        }
        let noAction = UIAlertAction(title: "Отмена", style: .destructive) { _ in
            print("Изменений нет")
        }
        alert.addAction(yesAction)
        alert.addAction(noAction)
        present(alert, animated: false)
    }
    
}

