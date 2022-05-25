//
//  myViewController.swift
//  Netology
//
//  Created by Александр Моксонов on 25.05.2022.
//

import UIKit

class myViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        print("screenWidth = \(screenWidth)")
        print("screenHeight = \(screenHeight)")
        if let myView1 = Bundle.main.loadNibNamed("myView", owner: nil, options: nil)?.first as? myView {
            myView1.frame = CGRect(x: 16, y: 50, width: screenWidth - 32, height: 400)
            view.addSubview(myView1)
        }
    }
}
