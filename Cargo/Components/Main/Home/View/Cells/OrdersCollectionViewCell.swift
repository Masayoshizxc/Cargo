//
//  OrdersCollectionViewCell.swift
//  Cargo
//
//  Created by Adilet on 2/7/23.
//

import UIKit
import SnapKit

class OrdersCollectionViewCell: UICollectionViewCell {
    
    var data: CellData?
    
    private lazy var trackNumberLabel: UILabel = {
        let l = UILabel()
        l.font = R.font.medium(size: 12)
        l.textColor = R.color.orderLabel()
        l.text = "Track number:"
        return l
    }()
    
    private lazy var trackNumber: UILabel = {
        let l = UILabel()
        l.font = R.font.medium(size: 18)
        l.textColor = .black
        l.text = "489483399-A-017002346"
        return l
    }()
    
    private lazy var orderNameLabel: UILabel = {
        let l = UILabel()
        l.font = R.font.medium(size: 12)
        l.textColor = R.color.orderLabel()
        l.text = "Order name"
        return l
    }()
    
    private lazy var orderName: UILabel = {
        let l = UILabel()
        l.font = R.font.medium(size: 18)
        l.textColor = .black
        l.text = "MacBookPro"
        return l
    }()
    
    private lazy var locationLabel: UILabel = {
        let l = UILabel()
        l.font = R.font.medium(size: 12)
        l.textColor = R.color.orderLabel()
        l.text = "Location:"
        return l
    }()
    
    private lazy var routeIcon: UIImageView = {
        let i = UIImageView()
        i.image = R.image.routeIcon()
        return i
    }()
    
    private lazy var loadLabel: UILabel = {
        let l = UILabel()
        l.font = R.font.medium(size: 18)
        l.textColor = .black
        l.text = "2972 Westheimer "
        return l
    }()
    
    private lazy var unloadLabel: UILabel = {
        let l = UILabel()
        l.font = R.font.medium(size: 18)
        l.textColor = .black
        l.text = "8502 Preston "
        return l
    }()
    
    private lazy var separate: UIView = {
        let v = UIView()
        v.layer.borderWidth = 1
        v.layer.borderColor = R.color.orderLabel()?.cgColor
        return v
    }()
    
    private lazy var driverLabel: UILabel = {
        let l = UILabel()
        l.font = R.font.medium(size: 12)
        l.textColor = R.color.orderLabel()
        l.text = "Driver"
        return l
    }()
    
    private lazy var driverPhoto: UIImageView = {
        let i = UIImageView()
        i.image = R.image.exAv()
        i.layer.cornerRadius = 23.5
        return i
    }()
    
    private lazy var driverName: UILabel = {
        let l = UILabel()
        l.font = R.font.semiBold(size: 16)
        l.textColor = .black
        l.text = "Kasymbekov Dastan"
        return l
    }()
    
    private lazy var driverCompany: UILabel = {
        let l = UILabel()
        l.font = R.font.regular(size: 14)
        l.textColor = .black
        l.text = "Mariene, LTD"
        return l
    }()
    
    private lazy var driverRateStar: UIImageView = {
        let i = UIImageView()
        i.image = R.image.star()
        return i
    }()
    
    private lazy var driverRateNumber: UILabel = {
        let l = UILabel()
        l.text = "4.8"
        l.textColor = R.color.rateColor()
        l.font = R.font.medium(size: 12)
        return l
    }()
    
    private lazy var chatBtn: UIButton = {
        let b = UIButton()
        b.setImage(R.image.message(), for: .normal)
//        b.imageView?.contentMode = .center
        b.layer.cornerRadius = 9
        b.backgroundColor = R.color.lightYellow()
        return b
    }()
    
    private lazy var status: UIImageView = {
        let i = UIImageView()
        
        return i
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
        setShadows()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setShadows() {
        
//        self.contentView.layer.cornerRadius = 12
//        self.contentView.layer.borderWidth = 2
//        self.contentView.layer.borderColor = UIColor.clear.cgColor
//        self.contentView.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowRadius = 6.5
        self.layer.shadowOpacity = 0.12
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
    
    @objc func createTapped() {
        
    }
    
    func setUpData(model: Order) {
        trackNumber.text = model.order_id
        loadLabel.text = model.point_a
        unloadLabel.text = model.point_b
        driverCompany.text = model.freight
        
    }
    
    
}

extension OrdersCollectionViewCell {
    
    func setupSubviews() {
        addSubviews(
            trackNumberLabel,
            trackNumber,
            orderNameLabel,
            orderName,
            locationLabel,
            routeIcon,
            loadLabel,
            unloadLabel,
            separate,
            driverLabel,
            driverPhoto,
            driverName,
            driverCompany,
            driverRateStar,
            driverRateNumber,
            chatBtn,
            status
        )
    }
    
    func setupConstraints() {
        trackNumberLabel.snp.makeConstraints{make in
            make.left.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(26)
        }
        trackNumber.snp.makeConstraints{make in
            make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(trackNumberLabel.snp.bottom).offset(6)
            make.height.equalTo(21)
        }
        orderNameLabel.snp.makeConstraints{make in
            make.left.equalToSuperview().inset(20)
            make.top.equalTo(trackNumber.snp.bottom).offset(16)
        }
        orderName.snp.makeConstraints{make in
            make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(orderNameLabel.snp.bottom).offset(6)
            make.height.equalTo(21)
        }
        locationLabel.snp.makeConstraints{make in
            make.left.equalToSuperview().inset(20)
            make.top.equalTo(orderName.snp.bottom).offset(16)
        }
        routeIcon.snp.makeConstraints{make in
            make.left.equalToSuperview().inset(20)
            make.top.equalTo(locationLabel.snp.bottom).offset(7.5)
            make.width.equalTo(18)
            make.height.equalTo(60)
        }
        loadLabel.snp.makeConstraints{make in
            make.left.equalTo(routeIcon.snp.right).offset(8)
            make.top.equalTo(locationLabel.snp.bottom).offset(6)
        }
        unloadLabel.snp.makeConstraints{make in
            make.left.equalTo(routeIcon.snp.right).offset(8)
            make.top.equalTo(loadLabel.snp.bottom).offset(21)
        }
        separate.snp.makeConstraints{make in
            make.left.right.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(108)
            make.height.equalTo(1)
        }
        driverLabel.snp.makeConstraints{make in
            make.top.equalTo(separate.snp.bottom).offset(22)
            make.left.equalToSuperview().inset(78)
            
        }
        driverPhoto.snp.makeConstraints{make in
            make.left.equalToSuperview().inset(20)
            make.top.equalTo(separate.snp.bottom).offset(26.5)
            make.height.width.equalTo(47)
        }
        driverName.snp.makeConstraints{make in
            make.left.equalToSuperview().inset(78)
            make.top.equalTo(driverLabel.snp.bottom).offset(4)
            
        }
        driverCompany.snp.makeConstraints{make in
            make.left.equalToSuperview().inset(78)
            make.top.equalTo(driverName.snp.bottom).offset(2)
        }
        driverRateStar.snp.makeConstraints{make in
            make.top.equalTo(driverName.snp.bottom).offset(3.77)
            make.left.equalTo(driverCompany.snp.right).offset(17.5)
        }
        driverRateNumber.snp.makeConstraints{make in
            make.centerY.equalTo(driverRateStar)
            make.left.equalTo(driverRateStar.snp.right).offset(4)
        }
        chatBtn.snp.makeConstraints{make in
            make.width.height.equalTo(38)
            make.top.equalTo(separate.snp.bottom).offset(31)
            make.right.equalToSuperview().inset(20)
        }
        status.snp.makeConstraints{make in
            
        }
    }
}
