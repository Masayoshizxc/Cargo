//
//  OrdersCollectionViewCell.swift
//  Cargo
//
//  Created by Adilet on 2/7/23.
//

import UIKit

class OrdersCollectionViewCell: UICollectionViewCell {
    
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
        l.text = ""
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
        l.text = ""
        return l
    }()
    
    private lazy var locationLabel: UILabel = {
        let l = UILabel()
        l.font = R.font.medium(size: 12)
        l.textColor = R.color.orderLabel()
        l.text = "Location:"
        return l
    }()
    
    private lazy var loadLabel: UILabel = {
        let l = UILabel()
        l.font = R.font.medium(size: 18)
        l.textColor = .black
        l.text = ""
        return l
    }()
    
    private lazy var unloadLabel: UILabel = {
        let l = UILabel()
        l.font = R.font.medium(size: 18)
        l.textColor = .black
        l.text = ""
        return l
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
        
        return i
    }()
    
    private lazy var driverName: UILabel = {
        let l = UILabel()
        l.font = R.font.semiBold(size: 16)
        l.textColor = .black
        l.text = "Darrell Steward"
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
        
        return i
    }()
    
    private lazy var driverRateNumber: UILabel = {
        let l = UILabel()
        
        return l
    }()
    
    private lazy var chatBtn: UIButton = {
        let b = UIButton()
        
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
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            loadLabel,
            unloadLabel,
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
        
    }
}
