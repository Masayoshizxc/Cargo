//
//  LoginView.swift
//  Cargo
//
//  Created by Adilet on 30/6/23.
//

import UIKit
import SnapKit

class LoginView: UIViewController {
    
    private lazy var headerTitle: UILabel = {
        let l = UILabel()
        l.text = "Авторизация"
        l.font = R.font.semiBold(size: 22)
        
        return l
    }()
    
    let items = ["Клиент", "Грузоперевозчик"]
    private lazy var segmentControl: UISegmentedControl = {
        let s = UISegmentedControl(items: items)
        s.selectedSegmentIndex = 0
        s.translatesAutoresizingMaskIntoConstraints = false
        s.selectedSegmentTintColor = R.color.lightYellow()
        s.backgroundColor = R.color.backgroundYellow()
        s.layer.borderWidth = 1
        s.layer.cornerRadius = 8
//        s.addTarget(self, action: nil, for: .valueChanged)
        return s
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = R.color.backgroundYellow()
        setupSubviews()
        setupConstraints()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("blyaaaa")
    }
    
}

extension LoginView {
    
    func setupSubviews() {
        view.addSubview(headerTitle)
        view.addSubview(segmentControl)
    }
    
    func setupConstraints() {
        headerTitle.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(37)
        }
        segmentControl.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(95)
            make.left.right.equalToSuperview().inset(12)
            make.height.equalTo(40)
        }
    }
}
