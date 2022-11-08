//
//  ViewController.swift
//  FitnessApp
//
//  Created by Daniel Alfonso on 7/29/22.
//

import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        handleInvalid()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    private func handleInvalid() {
        // Check auth status
        if Auth.auth().currentUser == nil {
            // Show log in, stays logged in
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }

}

