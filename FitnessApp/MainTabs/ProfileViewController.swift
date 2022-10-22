//
//  ProfileViewController.swift
//  FitnessApp
//
//  Created by Daniel Alfonso on 7/29/22.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    private func configureNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem (image: UIImage(systemName: "gear"),
                                                             style: .done,
                                                             target: self,
                                                             action: #selector(SettingsButtonTapped))
    }

    @objc private func SettingsButtonTapped() {
        let vc = SettingsViewController()
        vc.title = "Settings"
        navigationController?.pushViewController(vc, animated: true)
    }
}
