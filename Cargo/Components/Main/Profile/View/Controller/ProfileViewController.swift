//
//  ProfileViewController.swift
//  Cargo
//
//  Created by Adilet on 2/7/23.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    var coordinator: ProfileCoordinator?
    var ui = ProfileView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view = ui
        setupTableView()
        setupBonusCard()
    }
    
    func setupTableView() {
        ui.tableView.delegate = self
        ui.tableView.dataSource = self
    }
    
    func setupBonusCard() {
        ui.bonusCard.isUserInteractionEnabled = true
        ui.bonusCard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(bonusCardTapped)))
    }
    
    @objc func bonusCardTapped() {
        let bv = BonusView()
        if let vc = bv.presentationController as? UISheetPresentationController {
            vc.detents = [.medium()]
        }
//        bv.isModalInPresentation = true
        present(bv, animated: true)
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileTableViewCell
        cell.selectionStyle = .none
        

        switch indexPath.row {
        case 0:
            cell.icon.image = R.image.pinfo()
            cell.cellTitle.text = "Personal Information"
        case 1:
            cell.icon.image = R.image.phistory()
            cell.cellTitle.text = "History My Orders"
        case 2:
            cell.icon.image = R.image.ppayment()
            cell.cellTitle.text = "Payment Methods"
        case 3:
            cell.icon.image = R.image.pnotif()
            cell.cellTitle.text = "Notification"
        case 4:
            cell.icon.image = R.image.plog()
            cell.cellTitle.text = "Log out"
        default:
            print("error")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            present(PersonalView(), animated: true)
        case 1:
            present(HistoryView(), animated: true)
        case 2:
            present(PaymentView(), animated: true)
        case 3:
            present(NotificationsViewController(), animated: true)
        case 4:
//            present(PersonalView(), animated: true)
            print("logout")
        default:
            break
        }
    }
    
    
}
