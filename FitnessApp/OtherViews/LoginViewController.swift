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
        print("Login")
    }
    
    @IBAction func createAccount(_ sender: Any) {
        print("Create Account")
    }
    
    
}
