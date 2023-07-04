//
//  CreateOrderViewController.swift
//  Cargo
//
//  Created by Adilet on 4/7/23.
//

import UIKit

class CreateOrderViewController: BaseViewController {
    
    var coordinator: HomeCoordinator?
    var ui = CreateOrderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = ui
    }
}

extension CreateOrderViewController {
    
    func setupSubviews() {
        
    }
    
    func setupConstraints() {
        
    }
}
