//
//  ForText.swift
//  Cargo
//
//  Created by Adilet on 30/6/23.
//

import UIKit

class ForText: UITextField, UITextFieldDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 0, width: 366, height: 48)
        layer.cornerRadius = 8
        layer.borderWidth = 1
        autocapitalizationType = .none
        autocorrectionType = .no
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = R.color.selTab()?.cgColor
        textField.layer.borderWidth = 2
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
    }
    
    
    
    let padding = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)

        override open func textRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }

        override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }

        override open func editingRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }
    
}
