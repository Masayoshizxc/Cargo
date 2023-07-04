//
//  BaseViewController.swift
//  Cargo
//
//  Created by Adilet on 30/6/23.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = R.color.backgroundYellow()
        hideKeyboardWhenTappedAround()
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = .clear
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
}
