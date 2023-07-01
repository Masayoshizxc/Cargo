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
    var ui = ForgotView()
    
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
        if let vc = ui.presentationController as? UISheetPresentationController {
            vc.detents = [.medium(), .large()]
        }
        ui.isModalInPresentation = true
        self.navigationController?.present(ui, animated: false)
        hideKeyboardWhenTappedAround()
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

