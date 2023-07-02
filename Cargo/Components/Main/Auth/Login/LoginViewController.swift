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
//        presentChild()
        hideKeyboardWhenTappedAround()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presentChild()
    }
    
    
    
    func presentChild() {
            let childVC = LoginView()
            childVC.didDismiss = { [weak self] in
                self?.performActionAfterDismissal()
            }
        if let vc = childVC.presentationController as? UISheetPresentationController {
            vc.detents = [.medium(), .large()]
        }
        childVC.isModalInPresentation = true

            present(childVC, animated: true, completion: nil)
        }

        func performActionAfterDismissal() {
            
            self.dismiss(animated: true)
            coordinator?.forgot()
        }
    
//    @objc func imageTapped()
//    {
////        coordinator?.forgot()
//        print("image tapped")
//    }
    
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
