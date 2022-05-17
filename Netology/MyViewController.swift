//
//  MyViewController.swift
//  Netology
//
//  Created by Александр Моксонов on 17.05.2022.
//

import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()
           view.backgroundColor = .red
            let screenWidth = UIScreen.main.bounds.width
                    if let myView = Bundle.main.loadNibNamed("ViewOne", owner: nil, options: nil)?.first as? ViewOne {
                        myView.frame = CGRect(x: 16, y: 150, width: screenWidth - 32, height: 250)
                        view.addSubview(myView)
                    }
        }
    }

