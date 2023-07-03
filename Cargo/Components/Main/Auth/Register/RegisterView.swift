//
//  RegisterView.swift
//  Cargo
//
//  Created by Adilet on 2/7/23.
//

import UIKit
import SnapKit

class RegisterView: UIViewController {
    
    var didDismiss: (() -> Void)?
    
    private lazy var headerTitle: UILabel = {
        let l = UILabel()
        l.text = "Registration"
        l.font = R.font.semiBold(size: 22)
        return l
    }()
    
    let items = ["Client", "Transporter"]
    private lazy var segmentControl: UISegmentedControl = {
        let s = UISegmentedControl(items: items)
        s.selectedSegmentIndex = 0
        s.translatesAutoresizingMaskIntoConstraints = false
        s.selectedSegmentTintColor = R.color.lightYellow()
        s.backgroundColor = R.color.lightYellow()
        s.backgroundColor = .white
        s.layer.borderWidth = 1
        s.layer.cornerRadius = 8
        s.isSelected = true
        return s
    }()
    
    
    private lazy var fName: ForText = {
        let t = ForText()
        t.placeholder = "First name"
        t.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        return t
    }()
    
    private lazy var lName: ForText = {
        let t = ForText()
        t.placeholder = "Last name"
        t.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        return t
    }()
    
    private lazy var emailField: ForText = {
        let t = ForText()
        t.placeholder = "Email"
        t.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        return t
    }()
    
    private lazy var numberField: ForText = {
        let t = ForText()
        t.placeholder = "Phone number"
        t.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        return t
    }()
    
    private lazy var passwordField: ForText = {
        let t = ForText()
        t.placeholder = "Password"
        t.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        return t
    }()
    
    private lazy var confirmPasswordField: ForText = {
        let t = ForText()
        t.placeholder = "Confirm password"
        t.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        return t
    }()
    
    private lazy var loginButton: UIButton = {
        let b = UIButton()
        b.setTitle("Log in", for: .normal)
        b.setTitleColor(.black, for: .normal)
        b.titleLabel?.font = R.font.light(size: 12)
        b.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return b
    }()
    
    private lazy var registerButton: UIButton = {
        let b = UIButton()
        b.setTitle("Register", for: .normal)
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
        l.text = "Do you have an account? "
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
    
    
    @objc func regTapped() {
        print("Registration tapped")
    }
    
    @objc func textFieldChanged() {
        if (emailField.text != "" && passwordField.text != "" && numberField.text != "" && confirmPasswordField.text != "") {
            registerButton.layer.opacity = 1
            registerButton.addTarget(self, action: #selector(regTapped), for: .touchUpInside)
        }
        else {
            registerButton.layer.opacity = 0.7
            registerButton.removeTarget(self, action: #selector(regTapped), for: .touchUpInside)
        }
    }
    
    @objc func loginTapped() {
        self.dismiss(animated: true) { [weak self] in
            self?.didDismiss?()
        }

    }
    
}

extension RegisterView {
    
    func setupSubviews() {
        view.addSubviews(headerTitle,
                         segmentControl,
                         emailField,
                         numberField,
                         passwordField,
                         confirmPasswordField,
                         registerButton,
                         remindLabel,
                         loginButton,
                         fName,
                         lName)
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
        fName.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalTo(segmentControl.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(12)
            make.height.equalTo(48)
        }
        lName.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalTo(fName.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(12)
            make.height.equalTo(48)
        }
        emailField.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalTo(lName.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(12)
            make.height.equalTo(48)
        }
        numberField.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailField.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(12)
            make.height.equalTo(48)
        }
        passwordField.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalTo(numberField.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(12)
            make.height.equalTo(48)
        }
        confirmPasswordField.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordField.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(12)
            make.height.equalTo(48)
        }
        registerButton.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(12)
            make.height.equalTo(48)
            make.top.equalTo(confirmPasswordField.snp.bottom).offset(53)
        }
        remindLabel.snp.makeConstraints{make in
            make.top.equalTo(registerButton.snp.bottom).offset(18)
//            make.right.equalTo(registerButton.snp.centerX)
            make.centerX.equalToSuperview()
//            make.left.equalToSuperview().inset()
            
        }
        loginButton.snp.makeConstraints{make in
            make.left.equalTo(remindLabel.snp.right)
            make.centerY.equalTo(remindLabel)
            
        }
    }
}
