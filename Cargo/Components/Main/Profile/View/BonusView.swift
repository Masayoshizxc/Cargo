//
//  BonusView.swift
//  Cargo
//
//  Created by Adilet on 5/7/23.
//

import UIKit
import SnapKit

class BonusView: UIViewController {
    
    lazy var card: UIImageView = {
        let i = UIImageView()
        i.image = R.image.bonus()
        return i
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        view.backgroundColor = .blue
    }
    
}

extension BonusView {
    
    func setupSubviews() {
        view.addSubviews(
            card
        )
    }
    
    func setupConstraints() {
        card.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(50)
            make.width.equalTo(300)
            make.height.equalTo(266)
        }
    }
    
}
