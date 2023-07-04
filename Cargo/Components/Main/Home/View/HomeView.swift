//
//  HomeView.swift
//  Cargo
//
//  Created by Adilet on 2/7/23.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    var notifications: (() -> Void)?
    
    lazy var headerTitle: UILabel = {
        let l = UILabel()
        l.text = "Hi,Eliz"
        l.font = R.font.bold(size: 30)
        l.textColor = R.color.unselTab()
        l.isUserInteractionEnabled = true
        return l
    }()
    
    lazy var filter: UIButton = {
        let b = UIButton()
        b.setImage(R.image.filterNav(), for: .normal)
        return b
    }()
    
    lazy var notif: UIButton = {
        let b = UIButton()
        b.setImage(R.image.notifNav(), for: .normal)
//        b.addTarget(self, action: #selector(notifTapped), for: .touchUpInside)
//        b.isUserInteractionEnabled = true
        return b
    }()

    
    lazy var ordersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 30
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(OrdersCollectionViewCell.self)
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = R.color.backgroundYellow()
        return cv
    }()
    
    lazy var createOrderBtn: UIButton = {
        let b = UIButton()
        b.setTitle("Create an order", for: .normal)
        b.backgroundColor = R.color.goldYellow()
        b.setTitleColor(.white, for: .normal)
        b.layer.cornerRadius = 20
        b.addTarget(self, action: #selector(createTapped), for: .touchUpInside)
        b.titleLabel?.font = R.font.medium(size: 16)
        return b
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
        self.backgroundColor = R.color.backgroundYellow()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupNavBar() {
    }
    
    @objc func notifTapped() {
        self.notifications?()
    }
    
    @objc func createTapped() {
        print("Create Tapped")
    }
    
}

extension HomeView {
    
    func setupSubviews() {
        addSubview(headerTitle)
        addSubview(filter)
        addSubview(notif)
        addSubview(ordersCollectionView)
        addSubview(createOrderBtn)
    }
    
    func setupConstraints() {
        headerTitle.snp.makeConstraints{make in
            make.left.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(57)
            make.height.equalTo(36)
        }
        notif.snp.makeConstraints{make in
            make.width.equalTo(27)
            make.height.equalTo(26)
            make.centerY.equalTo(headerTitle)
            make.right.equalToSuperview().inset(20)
        }
        filter.snp.makeConstraints{make in
            make.width.height.equalTo(33)
            make.centerY.equalTo(headerTitle)
            make.right.equalTo(notif.snp.left).offset(-16)
        }
        ordersCollectionView.snp.makeConstraints{make in
            make.top.equalTo(headerTitle.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        createOrderBtn.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(105)
            make.width.equalTo(215)
            make.height.equalTo(48)
        }
    }
}
