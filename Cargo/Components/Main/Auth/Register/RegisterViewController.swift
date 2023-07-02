//
//  RegisterViewController.swift
//  Cargo
//
//  Created by Adilet on 2/7/23.
//

import UIKit
import SnapKit

class RegisterViewController: UIViewController {
    
    var coordinator: MainCoordinator?
    var ui = RegisterView()
    
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
//        presentChild()
        navigationItem.leftBarButtonItem = nil
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentChild()
    }
    func presentChild() {
        let childVC = RegisterView()
        childVC.didDismiss = { [weak self] in
            self?.performActionAfterDismissal()
        }
        if let vc = childVC.presentationController as? UISheetPresentationController {
            vc.detents = [.medium(), .large()]
        }
        childVC.isModalInPresentation = true
        present(childVC, animated: true,completion: nil)
    }
    
    func performActionAfterDismissal() {
        
        self.dismiss(animated: true)
        coordinator?.forgot()
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

