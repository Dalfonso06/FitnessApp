//
//  CreateAccountViewController.swift
//  FitnessApp
//
//  Created by Daniel Alfonso on 7/31/22.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    // Provide consistency in styling
    struct Constants {
        static let cornerRadius: CGFloat = 25.0
    }
    
    // Declare all buttons and fields
    private let registerUsernameField: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter Username"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let registerEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter Email"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let registerPasswordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Enter Password"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let confirmPasswordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Re-Enter Password"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemTeal
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerButton.addTarget(self,
                              action: #selector(registerAccount),
                              for: .touchUpInside)
        
        registerUsernameField.delegate = self
        registerEmailField.delegate = self
        registerPasswordField.delegate = self
        confirmPasswordField.delegate = self
        addSubviews()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // assign frames to text fields and button
        registerUsernameField.frame = CGRect(
            x: 25,
            y: 100,
            width: view.width - 50,
            height: 52.0
        )
        
        registerEmailField.frame = CGRect(
            x: 25,
            y: registerUsernameField.bottom + 15,
            width: view.width - 50,
            height: 52.0
        )
        
        registerPasswordField.frame = CGRect(
            x: 25,
            y: registerEmailField.bottom + 15,
            width: view.width - 50,
            height: 52.0
        )
        
        confirmPasswordField.frame = CGRect(
            x: 25,
            y: registerPasswordField.bottom + 15,
            width: view.width - 50,
            height: 52.0
        )
        
        registerButton.frame = CGRect(
            x: 25,
            y: confirmPasswordField.bottom + 15,
            width: view.width - 50,
            height: 52.0
        )
    }
    
    private func addSubviews() {
        view.addSubview(registerUsernameField)
        view.addSubview(registerEmailField)
        view.addSubview(registerPasswordField)
        view.addSubview(confirmPasswordField)
        view.addSubview(registerButton)
    }
    
    @objc private func registerAccount() {
        registerEmailField.resignFirstResponder()
        registerUsernameField.resignFirstResponder()
        registerPasswordField.resignFirstResponder()
        
        guard let email = registerUsernameField.text, !email.isEmpty,
              let password = registerPasswordField.text, !password.isEmpty, password.count >= 8,
              let username = registerUsernameField.text, !username.isEmpty, password == confirmPasswordField.text! else {
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

// When user presses enter, move to next text field
extension CreateAccountViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == registerUsernameField {
            registerEmailField.becomeFirstResponder()
        }
        else if textField == registerEmailField {
            registerPasswordField.becomeFirstResponder()
        }
        else if textField == confirmPasswordField {
            registerAccount()
        }
        
        return true
    }
}
