//
//  HomeCoordinator.swift
//  Cargo
//
//  Created by Adilet on 2/7/23.
//

import UIKit

class MapCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()

    var navigationController: UINavigationController

    var finishDelegate: CoordinatorFinishDelegate?

    var parentCoordinator: Coordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = MapViewController()
        vc.coordinator = self
        vc.tabBarItem = TabBarItems.third.tabbarItem
//        navigationController.hidesBarsOnSwipe = true
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}

