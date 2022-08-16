//
//  LoginViewController.swift
//  FitnessApp
//
//  Created by Daniel Alfonso on 7/31/22.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var userText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        // dismiss(animated: true, completion: nil)
        
        // removes keyboard upon pressing login button
        userText.resignFirstResponder()
        passwordText.resignFirstResponder()
        
        // checks if any fields are empty
        guard let usernameEmail = userText.text, !usernameEmail.isEmpty,
              let password = passwordText.text, !password.isEmpty, password.count >= 8 else {
                  return 
              }
        
        // login functionality
        
        var username: String?
        var email: String?
        
        print("Login")
        if usernameEmail.contains("@"), usernameEmail.contains(".") {
            email = usernameEmail
        } else {
            username = usernameEmail
        }
        
        AuthManager.shared.loginUser(username: username, email: email, password: password) { success in
            DispatchQueue.main.async {
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    let alert = UIAlertController(title: "Log in Error",
                                                  message: "We were unable to log you in.",
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss",
                                                  style: .cancel,
                                                  handler: nil))
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
    @IBAction func createAccount(_ sender: Any) {
        
        // Present create account storyboard view controller
        guard let createVC = storyboard?.instantiateViewController(identifier: "Create") as? CreateAccountViewController else {
            print("failed")
            return
        }
        // UINavigationController() used to show with title
        present(UINavigationController(rootViewController: createVC), animated: true)
        
        print("Create Account")
    }
    
    
}
