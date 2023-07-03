//
//  HomeViewController.swift
//  Cargo
//
//  Created by Adilet on 30/6/23.
//

import UIKit
import SnapKit

class HomeViewController: BaseViewController {
    
    var coordinator: HomeCoordinator?
    var ui = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = ui
    }
    
    func openNotifications() {
        
    }
    
}
