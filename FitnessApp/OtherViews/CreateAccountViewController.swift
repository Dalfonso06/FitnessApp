//
//  CreateAccountViewController.swift
//  FitnessApp
//
//  Created by Daniel Alfonso on 7/31/22.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var registerUsername: UITextField!
    
    @IBOutlet weak var registerEmail: UITextField!
    
    @IBOutlet weak var registerPassword: UITextField!
    
    @IBOutlet weak var confirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        // Do any additional setup after loading the view.
    }
    
    @IBAction func createAccount(_ sender: Any) {
        
        guard let email = registerEmail.text, !email.isEmpty,
              let password = registerPassword.text, !password.isEmpty, password.count >= 8,
              let username = registerUsername.text, !username.isEmpty, password == confirmPassword.text! else {
                  return
              }
        
        AuthManager.shared.registerNewUser(username: username, email: email, password: password) { registered in
            DispatchQueue.main.async {
                if registered {
                    // worked
                } else {
                    // failed
                }
            }
        }
    }
    
}
