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
    
//    override func loadView() {
//        view = ui
//
//    }
//
    override func viewDidLoad() {
        super.viewDidLoad()
        view = ui
        
        ui.notif.addTarget(self, action: #selector(openNotifications), for: .touchUpInside)
        ui.filter.addTarget(self, action: #selector(openFilter), for: .touchUpInside)
        ui.ordersCollectionView.delegate = self
        ui.ordersCollectionView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc func openFilter() {
        print("Filter")
        coordinator?.filter()
    }
    @objc func openNotifications() {
        print("Notification")
        coordinator?.notifications()
    }
    
}

extension HomeViewController {
    
    func setupSubviews() {
        
    }
    
    func setupConstraints() {
        
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.getReuseCell(OrdersCollectionViewCell.self, indexPath: indexPath)
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 12
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 366, height: 353)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator?.order()
    }
    
    
    
    
}
