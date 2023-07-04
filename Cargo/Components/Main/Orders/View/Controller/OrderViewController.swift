//
//  OrderViewController.swift
//  Cargo
//
//  Created by Adilet on 4/7/23.
//

import UIKit
import SnapKit

class OrderViewController: BaseViewController {
    
    var coordinator: HomeCoordinator?
    var ui = OrderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = ui
    }
}
