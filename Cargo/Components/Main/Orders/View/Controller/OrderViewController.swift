//
//  OrderViewController.swift
//  Cargo
//
//  Created by Adilet on 4/7/23.
//

import UIKit
import SnapKit

class OrderViewController: BaseViewController {
    
    var coordinator: HomeCoordinator?
    var ui = OrderView()
    
    private lazy var contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 400)
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.backgroundColor = R.color.backgroundYellow()
        view.frame = self.view.bounds
        view.contentSize = contentSize
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.frame.size = contentSize
        return view
    }()
    
    lazy var notif: UIButton = {
        let b = UIButton()
        b.setImage(R.image.notifNav(), for: .normal)
        b.addTarget(self, action: #selector(notifTapped), for: .touchUpInside)
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        containerView = ui
        setupSubviews()
        setupConstraints()
        print("View : ", self.view.frame.width)
        print("ContentSize w/h: ", contentSize)
        print("Scrollview :", scrollView.frame.width)
        print("Container : ", containerView.frame.size)
        print("ui : ", ui.frame.size)
    }
    @objc func notifTapped() {
        print("notif tapped")
    }
}

extension OrderViewController {
    
    func setupSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(ui)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints{make in
//            make.top.equalToSuperview().offset(-43)
            make.left.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(contentSize.height)
        }
//        notif.snp.makeConstraints{make in
//            make.centerX.centerY.equalToSuperview()
//        }
        ui.snp.makeConstraints{make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalToSuperview().inset(-43)
        }
    }
}
