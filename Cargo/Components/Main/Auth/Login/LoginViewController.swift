//
//  LoginViewController.swift
//  Cargo
//
//  Created by Adilet on 30/6/23.
//

import UIKit
import SnapKit



class LoginViewController: UIViewController {
    
    var coordinator: MainCoordinator?
    var ui = LoginView()
    
    private lazy var image: UIImageView = {
        let i = UIImageView()
        i.image = R.image.auth()
        return i
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
        setupConstraints()
        hideKeyboardWhenTappedAround()
        navigationItem.leftBarButtonItem = nil
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentChild()
    }
    
    
    
    func presentChild() {
        let childVC = LoginView()
        childVC.regDismiss = { [weak self] in
            self?.registrationPush()
        }
        childVC.logDismiss = { [weak self] in
            self?.loginPush()
        }
        childVC.forgotDismiss = { [weak self] in
            self?.forgotPush()
        }
        if let vc = childVC.presentationController as? UISheetPresentationController {
            vc.detents = [.medium(), .large()]
        }
        childVC.isModalInPresentation = true

            present(childVC, animated: true, completion: nil)
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
