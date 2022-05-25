//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Александр on 08.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    private lazy var headerView: UIView = {
        let view = ProfileHeaderView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.view.addSubview(self.headerView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.headerView.frame = view.safeAreaLayoutGuide.layoutFrame
    }
}
        

        
        





    
    

