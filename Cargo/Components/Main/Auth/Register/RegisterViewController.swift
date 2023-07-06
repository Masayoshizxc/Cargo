//
//  RegisterViewController.swift
//  Cargo
//
//  Created by Adilet on 2/7/23.
//

import UIKit
import SnapKit
import Alamofire

class RegisterViewController: UIViewController {
    
    var coordinator: MainCoordinator?
    private var ui = RegisterView()
    private let viewModel: RegisterViewModelProtocol
    
    init(viewModel: RegisterViewModelProtocol = RegisterViewModel()){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private lazy var image: UIImageView = {
        let i = UIImageView()
        i.image = R.image.reg()
        return i
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
        setupConstraints()
        hideKeyboardWhenTappedAround()
        navigationItem.leftBarButtonItem = nil
        ui.registerButton.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentChild()
    }
    func presentChild() {
        
        ui.didDismiss = { [weak self] in
            self?.performActionAfterDismissal()
        }
        if let vc = ui.presentationController as? UISheetPresentationController {
            vc.detents = [.medium(), .large()]
        }
        ui.isModalInPresentation = true
        present(ui, animated: true,completion: nil)
    }
    
    func performActionAfterDismissal() {
        
        self.dismiss(animated: true)
        coordinator?.start()
    }
    
    @objc func didTapRegisterButton() {
        guard let firstName = ui.fName.text,
              let lastName = ui.lName.text, let email = ui.emailField.text, let password = ui.passwordField.text, let phone = ui.numberField.text
        else { return
        }
        let parameters: [String : Any] = [
            "name" : "\(firstName) \(lastName)",
            "description" : "",
            "email" : email,
            "password" : password,
            "phone" : phone
        ]
        viewModel.signUp(params: parameters) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success:
                let sheet = UIAlertController(title: "Success", message: "Confirm registration in your email", preferredStyle: .alert)
                self.present(sheet, animated: true)
                self.performActionAfterDismissal()
            case .failure:
                print("error")
            }
        }
    }
    
}

extension RegisterViewController {
    
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

