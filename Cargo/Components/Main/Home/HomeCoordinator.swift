//
//  HomeCoordinator.swift
//  Cargo
//
//  Created by Adilet on 2/7/23.
//

import UIKit

class HomeCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()

    var navigationController: UINavigationController

    var finishDelegate: CoordinatorFinishDelegate?

    var parentCoordinator: Coordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = HomeViewController()
        vc.coordinator = self
        vc.tabBarItem = TabBarItems.first.tabbarItem
//        vc.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 28, bottom: 0, right: -28)
//        vc.navigationController?.hidesBarsOnSwipe = true
        navigationController.hidesBarsOnSwipe = true
        navigationController.pushViewController(vc, animated: true)
    }
    
    func notifications() {
        let vc = NotificationsViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }

    func filter() {
        let vc = FilterViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
        
    }
    
    func order() {
        let vc = OrderViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func createOrder() {
        let vc = CreateOrderViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}

