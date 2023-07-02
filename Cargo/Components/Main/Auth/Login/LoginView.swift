//
//  LoginView.swift
//  Cargo
//
//  Created by Adilet on 30/6/23.
//

import UIKit
import SnapKit




class LoginView: UIViewController {
//    var pvc: LoginViewController?
//    var pvc = LoginViewController()
    
    var didDismiss: (() -> Void)?
    
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
        s.backgroundColor = R.color.lightYellow()
        s.backgroundColor = .white
        s.layer.borderWidth = 1
        s.layer.cornerRadius = 8
        return s
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
    
    private lazy var forgotPassword: UIButton = {
        let b = UIButton()
        b.backgroundColor = .none
        b.setTitle("Забыли пароль?", for: .normal)
        b.titleLabel?.font = R.font.medium(size: 14)
        b.setTitleColor(R.color.textGray(), for: .normal)
        b.addTarget(self, action: #selector(forgetTapped), for: .touchUpInside)
        return b
    }()
    
    private lazy var regButton: UIButton = {
        let b = UIButton()
        b.setTitle("Зарегестрируйтесь", for: .normal)
        b.setTitleColor(.black, for: .normal)
        b.titleLabel?.font = R.font.light(size: 12)
        return b
    }()
    
    private lazy var loginButton: UIButton = {
        let b = UIButton()
        b.setTitle("Войти", for: .normal)
        b.backgroundColor = R.color.goldYellow()
        b.layer.opacity = 0.7
        b.titleLabel?.textAlignment = .center
        b.titleLabel?.font = R.font.medium(size: 16)
        b.setTitleColor(.white, for: .normal)
        b.layer.cornerRadius = 8
        if b.layer.opacity == 1 {
            b.addTarget(self, action: #selector(logTapped), for: .touchUpInside)
        }
        return b
    }()
    
    private lazy var forgotLabel: UILabel = {
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
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("blyaaaa")
    }
    
    @objc func logTapped() {
        print("Tapped")
    }
    
    @objc func textFieldChanged() {
        if (emailField.text != "" && passwordField.text != "") {
            loginButton.layer.opacity = 1
            loginButton.addTarget(self, action: #selector(logTapped), for: .touchUpInside)
        }
        else {
            loginButton.layer.opacity = 0.7
            loginButton.removeTarget(self, action: #selector(logTapped), for: .touchUpInside)
        }
    }
    
    @objc func forgetTapped() {
        self.dismiss(animated: true) { [weak self] in
            self?.didDismiss?()
        }
    }
    
}

extension LoginView {
    
    func setupSubviews() {
        view.addSubview(headerTitle)
        view.addSubview(segmentControl)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(forgotPassword)
        view.addSubview(loginButton)
        view.addSubview(forgotLabel)
        view.addSubview(regButton)
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
        emailField.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalTo(segmentControl.snp.bottom).offset(32)
            make.left.right.equalToSuperview().inset(12)
            make.height.equalTo(48)
        }
        passwordField.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailField.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(12)
            make.height.equalTo(48)
        }
        forgotPassword.snp.makeConstraints{make in
            make.top.equalTo(passwordField.snp.bottom).offset(12)
            make.height.equalTo(17)
            make.right.equalToSuperview().inset(12)
        }
        loginButton.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(12)
            make.height.equalTo(48)
            make.top.equalTo(passwordField.snp.bottom).offset(53)
        }
        forgotLabel.snp.makeConstraints{make in
            make.top.equalTo(loginButton.snp.bottom).offset(18)
            make.right.equalTo(loginButton.snp.centerX)
            
        }
        regButton.snp.makeConstraints{make in
            make.left.equalTo(forgotLabel.snp.right)
            make.centerY.equalTo(forgotLabel)
            
        }
    }
}
