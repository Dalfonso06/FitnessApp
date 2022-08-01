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
        view.backgroundColor = .systemMint
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        handleInvalid()
    }
    
    private func handleInvalid() {
        // Check auth status
        if Auth.auth().currentUser == nil {
            // Show log in, stays logged in
            guard let loginVC = storyboard?.instantiateViewController(identifier: "Login") as? LoginViewController else {
                print("failed")
                return
            }
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }


}

