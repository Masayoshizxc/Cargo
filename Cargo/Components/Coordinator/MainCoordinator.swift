//
//  MainCoordinator.swift
//  Cargo
//
//  Created by Adilet on 30/6/23.
//
//<key>NSLocationWhenInUseUsageDescription</key>
//    <string>Your precise location is used to calculate turn-by-turn directions, show your location on the map, and help improve the map.</string>
//    <key>NSLocationTemporaryUsageDescriptionDictionary</key>
//    <dict>
//      <key>LocationAccuracyAuthorizationDescription</key>
//      <string>Please enable precise location. Turn-by-turn directions only work when precise location data is available.</string>
//    </dict>

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    var finishDelegate: CoordinatorFinishDelegate?
    
    var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = LoginViewController()
        vc.coordinator = self
        vc.navigationItem.leftBarButtonItem = nil
        navigationController.pushViewController(vc, animated: true)
    }
    
    func register() {
        print("pushing...")
        let vc = RegisterViewController()
        vc.coordinator = self
        vc.navigationItem.leftBarButtonItem = nil
        navigationController.pushViewController(vc, animated: true)
    }
    
    func forgot() {
        let vc = ForgotViewController()
        vc.coordinator = self
        vc.navigationItem.leftBarButtonItem = nil
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goTabBar() {
        let child = TabBarCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
    }
    
    
}
