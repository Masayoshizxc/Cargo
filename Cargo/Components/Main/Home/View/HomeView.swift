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
    
    lazy var title: UILabel = {
        let l = UILabel()
        l.text = "Hi,Eliz"
        l.font = R.font.bold(size: 30)
        l.textColor = R.color.unselTab()
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
        b.addTarget(self, action: #selector(notifTapped), for: .touchUpInside)
        return b
    }()

    
    lazy var ordersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isPagingEnabled = true
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = R.color.backgroundYellow()
        return cv
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

    
}

extension HomeView {
    
    func setupSubviews() {
        addSubview(title)
        addSubview(filter)
        addSubview(notif)
        addSubview(ordersCollectionView)
    }
    
    func setupConstraints() {
        title.snp.makeConstraints{make in
            make.left.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(57)
            make.height.equalTo(36)
        }
        notif.snp.makeConstraints{make in
            make.width.equalTo(27)
            make.height.equalTo(26)
            make.centerY.equalTo(title)
            make.right.equalToSuperview().inset(20)
        }
        filter.snp.makeConstraints{make in
            make.width.height.equalTo(33)
            make.centerY.equalTo(title)
            make.right.equalTo(notif.snp.left).offset(-16)
        }
        ordersCollectionView.snp.makeConstraints{make in
            make.top.equalTo(title.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
