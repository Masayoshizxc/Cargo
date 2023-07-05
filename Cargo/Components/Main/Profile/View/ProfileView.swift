//
//  ProfileView.swift
//  Cargo
//
//  Created by Adilet on 5/7/23.
//

import UIKit
import SnapKit

class ProfileView: UIView {
    
    lazy var headerTitle: UILabel = {
        let l = UILabel()
        l.text = "Order"
        l.font = R.font.bold(size: 30)
        l.textColor = R.color.unselTab()
        l.isUserInteractionEnabled = true
        return l
    }()
    
    lazy var profilePic: UIImageView = {
        let i = UIImageView()
        i.image = R.image.defaultAv()
        return i
    }()
    
    lazy var username: UILabel = {
        let l = UILabel()
        l.font = R.font.bold(size: 18)
        l.textColor = R.color.unselTab()
        l.text = "Eliza Bekturova"
        return l
    }()
    
    lazy var mail: UILabel = {
        let l = UILabel()
        l.font = R.font.medium(size: 14)
        l.text = "elizzzzzvreeer@gmail.com"
        l.textColor = R.color.orderLabel()
        return l
    }()
    
    lazy var starIcon: UIImageView = {
        let i = UIImageView()
        i.image = R.image.star()
        return i
    }()
    
    lazy var rateLabel: UILabel = {
        let l = UILabel()
        l.font = R.font.light(size: 14)
        l.textColor = R.color.rateColor()
        l.text = "4.8"
        return l
    }()
    
    lazy var sinceLabel: UILabel = {
        let l = UILabel()
        l.textColor = R.color.since()
        l.text = "Registered Since Dec 2022"
        l.font = R.font.light(size: 14)
        return l
    }()
    
    lazy var editBtn: UIButton = {
        let b = UIButton()
        b.setImage(R.image.edit(), for: .normal)
        return b
    }()
    
    lazy var tableView: UITableView = {
        let t = UITableView()
        t.register(ProfileTableViewCell.self, forCellReuseIdentifier: "cell")
        t.isScrollEnabled = false
        t.backgroundColor = R.color.backgroundYellow()
        t.separatorInset = .zero
        t.separatorStyle = .singleLine
        return t
    }()
    
    lazy var bonusCard: UIImageView = {
        let i = UIImageView()
        i.image = R.image.bonus()
        return i
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = R.color.backgroundYellow()
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension ProfileView {
    
    func setupSubviews() {
        addSubviews(
            headerTitle,
            profilePic,
            username,
            mail,
            starIcon,
            rateLabel,
            sinceLabel,
            editBtn,
            tableView,
            bonusCard
        )
    }
    
    func setupConstraints() {
        headerTitle.snp.makeConstraints{make in
            make.left.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(57)
            make.height.equalTo(36)
        }
        profilePic.snp.makeConstraints{make in
            make.left.equalToSuperview().inset(20)
            make.top.equalTo(headerTitle.snp.bottom).offset(47)
            make.width.height.equalTo(75)
        }
        username.snp.makeConstraints{make in
            make.top.equalTo(profilePic.snp.top).inset(-7)
            make.left.equalTo(profilePic.snp.right).offset(12)
            make.width.equalTo(225)
            make.height.equalTo(21)
        }
        mail.snp.makeConstraints{make in
            make.left.equalTo(profilePic.snp.right).offset(12)
            make.width.height.equalTo(username)
            make.top.equalTo(username.snp.bottom).offset(2)
        }
        starIcon.snp.makeConstraints{make in
            make.left.equalTo(profilePic.snp.right).offset(12)
            make.width.equalTo(18)
            make.height.equalTo(17)
            make.top.equalTo(mail.snp.bottom).offset(12)
        }
        rateLabel.snp.makeConstraints{make in
            make.centerY.equalTo(starIcon)
            make.left.equalTo(starIcon.snp.right).offset(4)
        }
        sinceLabel.snp.makeConstraints{make in
            make.centerY.equalTo(starIcon)
            make.left.equalTo(rateLabel.snp.right).offset(12)
            make.height.equalTo(17)
        }
        editBtn.snp.makeConstraints{make in
            make.right.equalToSuperview().inset(20)
            make.centerY.equalTo(profilePic)
        }
        tableView.snp.makeConstraints{make in
            make.top.equalTo(profilePic.snp.bottom).offset(12)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(250)
        }
        bonusCard.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalTo(tableView.snp.bottom).offset(20)
//            make.height.equalTo(214)
        }
    }
    
}
