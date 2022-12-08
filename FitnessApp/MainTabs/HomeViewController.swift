//
//  ViewController.swift
//  FitnessApp
//
//  Created by Daniel Alfonso on 7/29/22.
//

import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FitnessFeedPostTableViewCell.self,
                           forCellReuseIdentifier: FitnessFeedPostTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleInvalid()
    }
    
    /// Allow whether a user is logged in or not
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

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FitnessFeedPostTableViewCell.identifier, for: indexPath) as! FitnessFeedPostTableViewCell
        
        return cell
    }
}
