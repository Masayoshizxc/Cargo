//
//  TabBarController.swift
//  Cargo
//
//  Created by Adilet on 2/7/23.
//

import UIKit
import SnapKit

enum TabBarItems: CaseIterable {
    case first
    case second
    case third
    case fourth

    var tabbarItem: UITabBarItem {
        switch self {
        case .first:
            return .init(
                title: "Orders",
                image: R.image.orderP(),
                tag: 1
            )

        case .second:
            return .init(
                title: "Chat",
                image: R.image.chatP(),
                tag: 1
            )
            
        case .third:
            return .init(
                title: "Map",
                image: R.image.mapP(),
                tag: 1
            )
            
        case .fourth:
            return .init(
                title: "Profile",
                image: R.image.profileP(),
                tag: 1
            )
        }
    }
}

class TabBarController: UITabBarController {
    weak var coordinator: TabBarCoordinator?

    let homeCoordinator = HomeCoordinator(navigationController: UINavigationController())
    let chatCoordinator = ChatCoordinator(navigationController: UINavigationController())
    let profileCoordinator = ProfileCoordinator(navigationController: UINavigationController())
    let mapCoordinator = MapCoordinator(navigationController: UINavigationController())

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        configureTabs()
        UITabBar.appearance().tintColor = R.color.selTab()
        UITabBar.appearance().unselectedItemTintColor = R.color.unselTab()

        navigationItem.hidesBackButton = true
//        navigationController?.navigationBar.backgroundColor = R.color.tint()
        tabBarController?.tabBar.isTranslucent = true
        tabBarController?.tabBar.backgroundColor = .none
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    private func configureTabs() {
        homeCoordinator.start()
        chatCoordinator.start()
        profileCoordinator.start()
        mapCoordinator.start()
        viewControllers = [
            homeCoordinator.navigationController,
            chatCoordinator.navigationController,
            mapCoordinator.navigationController,
            profileCoordinator.navigationController
        ]
//        tabBar.alpha = 0.95
        let tab = UITabBarAppearance()
        tab.backgroundEffect = .none
//        tab.shadowColor = .clear

        tab.stackedItemWidth = 50
        tab.stackedItemSpacing = 50
//        tab.stackedItemPositioning =

        tabBar.standardAppearance = tab
        
//        tabBar.scrollEdgeAppearance = tab

    }

    private func setupConstraints() {
        let positionOnX: CGFloat = 59
        let positionOnY: CGFloat = 22
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2

        let bg = UIView()
        bg.backgroundColor = R.color.backgroundYellow()
        bg.layer.cornerRadius = 16
//        bg.layer.opacity = 40
        tabBar.addSubview(bg)
//        let clicked = UIView()
//        clicked.backgroundColor = R.color.backgroundYellow()
//        clicked.layer.cornerRadius = 20
        bg.snp.makeConstraints {make in
            make.width.equalToSuperview()
            make.height.equalTo(92)
//            make.left.right.equalToSuperview().inset(59)
//            make.bottom.equalToSuperview().inset(30)
            make.bottom.equalToSuperview()
        }
//        clicked.snp.makeConstraints {make in
//            make.width.equalTo(106)
//            make.height.equalTo(83)
//        }
//        bg.addSubview(clicked)

    }

}


