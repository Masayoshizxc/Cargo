//
//  Extension + UINavigationBar.swift
//  Cargo
//
//  Created by Adilet on 4/7/23.
//

import UIKit

extension UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.isEnabled = false
    }
}

