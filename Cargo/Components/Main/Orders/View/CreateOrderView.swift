//
//  CreateOrderView.swift
//  Cargo
//
//  Created by Adilet on 4/7/23.
//

import UIKit
import SnapKit

class CreateOrderView: UIView {
    
    
    lazy var headerTitle: UILabel = {
        let l = UILabel()
        l.text = "Order"
        l.font = R.font.bold(size: 30)
        l.textColor = R.color.unselTab()
        l.isUserInteractionEnabled = true
        return l
    }()
    
    lazy var notif: UIButton = {
        let b = UIButton()
        b.setImage(R.image.notifNav(), for: .normal)
        b.addTarget(self, action: #selector(notifTapped), for: .touchUpInside)
//        b.isUserInteractionEnabled = true
        return b
    }()
    
    lazy var smallerHeaderTitle: UILabel = {
        let l = UILabel()
        l.font = R.font.semiBold(size: 22)
        l.text = "Create an order"
        return l
    }()
    
    lazy var minimalTitle: UILabel = {
        let l = UILabel()
        l.font = R.font.medium(size: 14)
        l.text = "Fill in all the fields to receive the order"
        return l
    }()
    
    lazy var orderName: ForText = {
        let t = ForText()
        t.placeholder = "Order name"
        return t
    }()
    
    lazy var trackNumber: ForText = {
        let t = ForText()
        t.placeholder = "438793379-A-398765"
        return t
    }()
    
    lazy var typeOfCargo: ForText = {
        let t = ForText()
        t.placeholder = "Type of cargo"
        return t
    }()
    
    lazy var weight: ForText = {
        let t = ForText()
        t.placeholder = "Weight"
        return t
    }()
    
    lazy var loadingPoint: ForText = {
        let t = ForText()
        t.placeholder = "Loading point"
        return t
    }()
    
    lazy var unloadingPlace: ForText = {
        let t = ForText()
        t.placeholder = "Place of unloading"
        return t
    }()
    
    lazy var priceCount: ForText = {
        let t = ForText()
        t.placeholder = "Price (1,5$ per mile(0.5$ per mile for petro))"
        return t
    }()
    
    lazy var finishCreatingBtn: UIButton = {
        let b = UIButton()
        b.setTitle("Create an order", for: .normal)
        b.backgroundColor = R.color.goldYellow()
        b.setTitleColor(.white, for: .normal)
        b.layer.cornerRadius = 8
        b.titleLabel?.font = R.font.medium(size: 16)
        return b
    }()
    
   

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func notifTapped() {
        print("notiftapped")
    }
    
}

extension CreateOrderView {
    
    func setupSubviews() {
        addSubviews(
            headerTitle,
            notif,
            smallerHeaderTitle,
            minimalTitle,
            orderName,
            trackNumber,
            typeOfCargo,
            weight,
            loadingPoint,
            unloadingPlace,
            priceCount,
            finishCreatingBtn
        )
    }
    
    func setupConstraints() {
        backgroundColor = R.color.backgroundYellow()
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
        smallerHeaderTitle.snp.makeConstraints{make in
            make.top.equalTo(headerTitle.snp.bottom).offset(11)
            make.left.equalToSuperview().inset(20)
            make.height.equalTo(26)
        }
        minimalTitle.snp.makeConstraints{make in
            make.top.equalTo(smallerHeaderTitle.snp.bottom).offset(8)
            make.left.equalToSuperview().inset(20)
            make.height.equalTo(17)
        }
        orderName.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(12)
            make.height.equalTo(46)
            make.top.equalTo(minimalTitle.snp.bottom).offset(22)
        }
        trackNumber.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(12)
            make.height.equalTo(46)
            make.top.equalTo(orderName.snp.bottom).offset(16)
        }
        typeOfCargo.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(12)
            make.height.equalTo(46)
            make.top.equalTo(trackNumber.snp.bottom).offset(16)
        }
        weight.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(12)
            make.height.equalTo(46)
            make.top.equalTo(typeOfCargo.snp.bottom).offset(16)
        }
        loadingPoint.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(12)
            make.height.equalTo(46)
            make.top.equalTo(weight.snp.bottom).offset(16)
        }
        unloadingPlace.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(12)
            make.height.equalTo(46)
            make.top.equalTo(loadingPoint.snp.bottom).offset(16)
        }
        priceCount.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(12)
            make.height.equalTo(46)
            make.top.equalTo(unloadingPlace.snp.bottom).offset(16)
        }
        finishCreatingBtn.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(12)
            make.height.equalTo(46)
            make.top.equalTo(priceCount.snp.bottom).offset(24)
        }
        
        
        
    }
}
