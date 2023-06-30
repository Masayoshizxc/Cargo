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
        if let vc = ui.presentationController as? UISheetPresentationController {
            vc.detents = [.medium(), .large()]
        }
        ui.isModalInPresentation = true
        self.present(ui, animated: false)
//        for family in UIFont.familyNames {
//            print("\(family)")
//
//            for name in UIFont.fontNames(forFamilyName: family) {
//                print("   \(name)")
//            }
//        }
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
