//
//  LoginViewController.swift
//  Cargo
//
//  Created by Adilet on 30/6/23.
//

import UIKit
import SnapKit
import Alamofire


class LoginViewController: UIViewController {
    
    var coordinator: MainCoordinator?
    var ui = LoginView()
    private let viewModel: LoginViewModelProtocol
    
    init(viewModel: LoginViewModelProtocol = LoginViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var image: UIImageView = {
        let i = UIImageView()
        i.image = R.image.auth()
        return i
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
        setupSubviews()
        setupConstraints()
        hideKeyboardWhenTappedAround()
        navigationItem.leftBarButtonItem = nil
        
        ui.loginButton.addTarget(self, action: #selector(didLoginTapped), for: .touchUpInside)
    }
    
    @objc func update() {
        print("Hello")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentChild()
    }
    
    func presentChild() {
        ui.regDismiss = { [weak self] in
            self?.registrationPush()
        }
        ui.logDismiss = { [weak self] in
            self?.didLoginTapped()
        }
        ui.forgotDismiss = { [weak self] in
            self?.forgotPush()
        }
        if let vc = ui.presentationController as? UISheetPresentationController {
            vc.detents = [.medium(), .large()]
        }
        ui.isModalInPresentation = true

            present(ui, animated: true, completion: nil)
        }

        func registrationPush() {
            
            self.dismiss(animated: true)
            coordinator?.register()
        }
    
    func loginPush() {
        
        self.dismiss(animated: true)
        coordinator?.goTabBar()
    }
    func forgotPush() {
        self.dismiss(animated: true)
        coordinator?.forgot()
    }
    
    func qprint(){
        print("Works")
    }
    
    @objc func didLoginTapped() {
        guard let email = ui.emailField.text, let password = ui.passwordField.text else {
            return
        }
        print(email, password)
        let isShipper = ui.segmentControl.selectedSegmentIndex == 0 ? true : false
        viewModel.login(email: email, password: password, isShipper: isShipper) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success:
                print("Success")
                self.dismiss(animated: true)
                self.coordinator?.goTabBar()
//                self.coordinator?.goTabBar()
            case .failure:
                
                print("error")
                
            }
        }
    }
    
    
//    @objc func didLoginTapped() {
//        let parameters: Parameters = [
//            "email": "masayoshizxc@gmail.com",
//            "password": "123"
//        ]
//
//        let headers: HTTPHeaders = [
//            "Content-Type": "application/json"
//        ]
//
//        AF.request("http://127.0.0.1:8080/shipper/login", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
//            .responseJSON { response in
//                switch response.result {
//                case .success(let value):
//                    print("Регистрация успешна: \(value)")
//                case .failure(let error):
//                    print("Ошибка регистрации: \(error)")
//                }
//            }
//    }
    
}

extension LoginViewController {
    
    func setupSubviews() {
        view.addSubview(image)

    }
    
    func setupConstraints() {
        image.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(75)
        }
    }
}
