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
//        b.isUserInteractionEnabled = true
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

extension OrderView {
    
    func setupSubviews() {
        addSubviews(
            headerTitle,
            notif
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
    }
}
