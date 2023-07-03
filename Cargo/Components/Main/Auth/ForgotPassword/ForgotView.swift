//
//  ForgotView.swift
//  Cargo
//
//  Created by Adilet on 1/7/23.
//

import UIKit
import SnapKit

class ForgotView: UIViewController {
//    var pvc: LoginViewController?
//    var pvc = LoginViewController()
    
    var recoveredDismiss: (() -> Void)?
    
    private lazy var headerTitle: UILabel = {
        let l = UILabel()
        l.text = "Восстановление пароля"
        l.font = R.font.semiBold(size: 22)
        return l
    }()

    
    private lazy var emailField: ForText = {
        let t = ForText()
        t.placeholder = "Email"
        t.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        return t
    }()
    
    private lazy var passwordField: ForText = {
        let t = ForText()
        t.placeholder = "Password"
        t.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        return t
    }()
    
    private lazy var regButton: UIButton = {
        let b = UIButton()
        b.setTitle("Зарегестрируйтесь", for: .normal)
        b.setTitleColor(.black, for: .normal)
        b.titleLabel?.font = R.font.light(size: 12)
        return b
    }()
    
    private lazy var recoverButton: UIButton = {
        let b = UIButton()
        b.setTitle("Восстановить ", for: .normal)
        b.backgroundColor = R.color.goldYellow()
        b.layer.opacity = 0.7
        b.titleLabel?.textAlignment = .center
        b.titleLabel?.font = R.font.medium(size: 16)
        b.setTitleColor(.white, for: .normal)
        b.layer.cornerRadius = 8
        return b
    }()
    
    private lazy var remindLabel: UILabel = {
        let l = UILabel()
        l.text = "У вас нет аккаунта? "
        l.font = R.font.light(size: 12)
        l.textColor = R.color.textGray()
        return l
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = R.color.backgroundYellow()
        setupSubviews()
        setupConstraints()
    }
    
    @objc func logTapped() {
        print("Login tapped")
    }
    
    @objc func textFieldChanged() {
        if (emailField.text != "" && passwordField.text != "") {
            recoverButton.layer.opacity = 1
            recoverButton.addTarget(self, action: #selector(recoverTapped), for: .touchUpInside)
        }
        else {
            recoverButton.layer.opacity = 0.7
            recoverButton.removeTarget(self, action: #selector(recoverTapped), for: .touchUpInside)
        }
    }
    
    @objc func recoverTapped() {
        self.dismiss(animated: true) { [weak self] in
            self?.recoveredDismiss?()
        }
    }
    
}

extension ForgotView {
    
    func setupSubviews() {
        view.addSubview(headerTitle)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(recoverButton)
        view.addSubview(remindLabel)
        view.addSubview(regButton)
    }
    
    func setupConstraints() {
        headerTitle.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(37)
        }
        emailField.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(94)
            make.left.right.equalToSuperview().inset(12)
            make.height.equalTo(48)
        }
        passwordField.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailField.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(12)
            make.height.equalTo(48)
        }
        recoverButton.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(12)
            make.height.equalTo(48)
            make.top.equalTo(passwordField.snp.bottom).offset(53)
        }
        remindLabel.snp.makeConstraints{make in
            make.top.equalTo(recoverButton.snp.bottom).offset(18)
            make.right.equalTo(recoverButton.snp.centerX)
            
        }
        regButton.snp.makeConstraints{make in
            make.left.equalTo(remindLabel.snp.right)
            make.centerY.equalTo(remindLabel)
            
        }
    }
}
