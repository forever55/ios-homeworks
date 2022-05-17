//
//  ViewOne.swift
//  Netology
//
//  Created by Александр Моксонов on 17.05.2022.
//

import UIKit

class ViewOne: UIView {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var myButton: UIButton!
    @IBAction func buttonAction(_ sender: UIButton) {
        label.text = "Hello!"
    }
    @IBOutlet weak var text: UITextView!
    @IBOutlet weak var img1: UIImageView!
    
}
