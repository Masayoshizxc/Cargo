//
//  Extension + UIView.swift
//  Cargo
//
//  Created by Adilet on 1/7/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIView {
    func printViewHierarchy() {
        print(self.debugDescription)
                for subview in subviews {
                    subview.printViewHierarchy()
                }
    }
}
