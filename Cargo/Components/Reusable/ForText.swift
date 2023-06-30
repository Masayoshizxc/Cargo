//
//  ForText.swift
//  Cargo
//
//  Created by Adilet on 30/6/23.
//

import UIKit

class ForText: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 0, width: 366, height: 48)
        layer.cornerRadius = 8
        layer.borderWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
