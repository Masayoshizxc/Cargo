//
//  CreateOrderViewController.swift
//  Cargo
//
//  Created by Adilet on 4/7/23.
//

import UIKit

class CreateOrderViewController: BaseViewController {
    
    var coordinator: HomeCoordinator?
    var ui = CreateOrderView()
    private let viewModel: CreateViewModelProtocol
    
    init(viewModel: CreateViewModelProtocol = CreateViewModel()){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = ui
    }
    
    
    @objc func createTapped() {
//        guard let shipperID = ui.orderName.text, 
    }
    
    
}

extension CreateOrderViewController {
    
    func setupSubviews() {
        
    }
    
    func setupConstraints() {
        
    }
}
