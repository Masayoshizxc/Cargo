//
//  OrderView.swift
//  Cargo
//
//  Created by Adilet on 4/7/23.
//

import UIKit
import SnapKit

class OrderView: UIView {
    
    
    lazy var headerTitle: UILabel = {
        let l = UILabel()
        l.text = "Order"
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
        b.addTarget(self, action: #selector(notifTapped), for: .touchUpInside)
        return b
    }()
    
    lazy var backButton: UIButton = {
        let b = UIButton()
        b.setImage(R.image.backButton(), for: .normal)
        b.setTitle("Back", for: .normal)
        b.setTitleColor(.black, for: .normal)
        b.titleLabel?.font = R.font.medium(size: 12)
        b.backgroundColor = .none
        b.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        return b
    }()
    
    lazy var driverPhoto: UIImageView = {
        let i = UIImageView()
        i.layer.cornerRadius = 23.5
        return i
    }()
    
    lazy var driverLabel: UILabel = {
        let l = UILabel()
        l.text = "Driver"
        l.font = R.font.medium(size: 12)
        l.textColor = R.color.orderLabel()
        return l
    }()
    
    lazy var driverName: UILabel = {
        let l = UILabel()
        l.font = R.font.semiBold(size: 16)
        l.textColor = .black
        return l
    }()
    
    lazy var starIcon: UIImageView = {
        let i = UIImageView()
        i.image = R.image.star()
        
        return i
    }()
    
    lazy var rateNumber: UILabel = {
        let l = UILabel()
        l.textColor = R.color.rateColor()
        l.font = R.font.medium(size: 12)
        return l
    }()
    
    lazy var chatBtn: UIButton = {
        let b = UIButton()
        b.setImage(R.image.message(), for: .normal)
        b.layer.cornerRadius = 9
        b.backgroundColor = R.color.lightYellow()
        return b
    }()
    
    lazy var orderName: ForText = {
        let t = ForText()
        t.placeholder = "Order name"
        t.isUserInteractionEnabled = false
        return t
    }()
    
    lazy var trackNumber: ForText = {
        let t = ForText()
        t.placeholder = "438793379-A-398765"
        t.isUserInteractionEnabled = false
        return t
    }()
    
    lazy var typeOfCargo: ForText = {
        let t = ForText()
        t.placeholder = "Type of cargo"
        t.isUserInteractionEnabled = false
        return t
    }()
    
    lazy var weight: ForText = {
        let t = ForText()
        t.placeholder = "Weight"
        t.isUserInteractionEnabled = false
        return t
    }()
    
    lazy var loadingPoint: ForText = {
        let t = ForText()
        t.placeholder = "Loading point"
        t.isUserInteractionEnabled = false
        return t
    }()
    
    lazy var unloadingPlace: ForText = {
        let t = ForText()
        t.placeholder = "Place of unloading"
        t.isUserInteractionEnabled = false
        return t
    }()
    
    lazy var priceCount: ForText = {
        let t = ForText()
        t.placeholder = "Price (1,5$ per mile(0.5$ per mile for petro))"
        t.isUserInteractionEnabled = false
        return t
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
    
    @objc func backTapped() {
        print("backTapped")
    }
    
}

extension OrderView {
    
    func setupSubviews() {
        addSubviews(
            headerTitle,
            notif,
            backButton,
            driverLabel,
            driverPhoto,
            driverName,
            starIcon,
            rateNumber,
            chatBtn,
            orderName,
            trackNumber,
            orderName,
            trackNumber,
            typeOfCargo,
            weight,
            loadingPoint,
            unloadingPlace,
            priceCount
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
            make.right.equalToSuperview().inset(-150)
        }
        backButton.snp.makeConstraints{make in
            make.left.equalToSuperview().inset(12)
            make.top.equalTo(headerTitle.snp.bottom).offset(10)
            make.height.equalTo(15)
        }
        driverLabel.snp.makeConstraints{make in
            make.top.equalTo(backButton.snp.bottom).offset(8)
            make.left.equalToSuperview().inset(79)
            make.height.equalTo(14)
        }
        driverPhoto.snp.makeConstraints{make in
            make.left.equalToSuperview().inset(12)
            make.centerY.equalTo(driverName)
        }
        driverName.snp.makeConstraints{make in
            make.left.equalTo(driverLabel)
            make.top.equalTo(driverLabel.snp.bottom).offset(4)
            make.height.equalTo(19)
        }
        starIcon.snp.makeConstraints{make in
            make.left.equalTo(driverName)
            make.top.equalTo(driverName.snp.bottom).offset(2)
            make.width.equalTo(18)
            make.height.equalTo(17)
        }
        rateNumber.snp.makeConstraints{make in
            make.centerY.equalTo(starIcon)
            make.left.equalTo(starIcon.snp.right).offset(4)
        }
        chatBtn.snp.makeConstraints{make in
            make.width.height.equalTo(38)
            make.centerY.equalTo(driverName)
            make.right.equalToSuperview().inset(12)
        }
        orderName.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(12)
            make.height.equalTo(46)
            make.top.equalTo(starIcon.snp.bottom).offset(16)
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
        
        
        
    }
}
