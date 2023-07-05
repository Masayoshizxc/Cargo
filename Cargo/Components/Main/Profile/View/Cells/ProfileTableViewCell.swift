//
//  ProfileTableViewCell.swift
//  Cargo
//
//  Created by Adilet on 5/7/23.
//

import UIKit
import SnapKit

class ProfileTableViewCell: UITableViewCell {
    
    lazy var icon: UIImageView = {
        let i = UIImageView()
        return i
    }()
    
    lazy var cellTitle: UILabel = {
        let l = UILabel()
        l.font = R.font.medium(size: 12)
        l.textColor = R.color.unselTab()
        l.text = "nqdjkwnkjqw"
        return l
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = R.color.backgroundYellow()
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ProfileTableViewCell {
    
    func setupSubviews() {
        contentView.addSubviews(
            icon,
            cellTitle
        )
    }
    
    func setupConstraints() {
        icon.snp.makeConstraints{make in
            make.top.equalToSuperview().inset(14)
            make.left.equalToSuperview().inset(12)
            make.width.height.equalTo(22)
        }
        cellTitle.snp.makeConstraints{make in
            make.centerY.equalTo(icon)
            make.left.equalTo(icon.snp.right).offset(11)
            
        }
    }
    
}
