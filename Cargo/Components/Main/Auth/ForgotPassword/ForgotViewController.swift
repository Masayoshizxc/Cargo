//
//  ForgotViewController.swift
//  Cargo
//
//  Created by Adilet on 1/7/23.
//

import UIKit
import SnapKit

class ForgotViewController: UIViewController {
    
    var coordinator: MainCoordinator?
    var ui = LoginView()
    
    private lazy var image: UIImageView = {
        let i = UIImageView()
        i.image = R.image.forgot()
        return i
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
        setupConstraints()
//        presentChild()
        hideKeyboardWhenTappedAround()
        navigationItem.leftBarButtonItem = nil
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentChild()
    }
    
    
    
    func presentChild() {
            let childVC = ForgotView()
            childVC.recoveredDismiss = { [weak self] in
                self?.recoveredPush()
            }
        if let vc = childVC.presentationController as? UISheetPresentationController {
            vc.detents = [.medium(), .large()]
        }
        childVC.isModalInPresentation = true

            present(childVC, animated: true, completion: nil)
        }

    
    func recoveredPush() {
        
        coordinator?.start()
    }
    
}

extension ForgotViewController {
    
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
