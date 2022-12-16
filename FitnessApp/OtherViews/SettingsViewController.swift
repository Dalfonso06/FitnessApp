//
//  SettingsViewController.swift
//  FitnessApp
//
//  Created by Daniel Alfonso on 10/22/22.
//

import UIKit

struct SettingCellModel {
    let title: String
    let handler: (() -> Void)
}

/// View Controller for user settings
final class SettingsViewController: UIViewController {
    
    private let tableView: UITableView = {
        // create table view with style and frame
        let tableView = UITableView(frame: .zero,
                                    style: .grouped) // default look of table view sections
        
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    // a collection of collections
    private var data = [[SettingCellModel]]() // 2d array because of multiple sections
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    // TODO: fix weak self and create functions for settings cells
    
    /// Create table cells for settings page
    private func configureModels() {
        data.append([
            SettingCellModel(title: "Edit Profile") { [weak self] in
                self?.editProfileTapped()
            },
            SettingCellModel(title: "Invite Friends") { [weak self] in
                self?.inviteFriendsTapped()
            },
            SettingCellModel(title: "Save Original Posts") { [weak self] in
                self?.saveOriginalPostsTapped()
            }
        ])
        
        data.append([
            SettingCellModel(title: "Terms of Service") { [weak self] in
                self?.termsOfServiceTapped()
            },
            SettingCellModel(title: "Privacy Policy") { [weak self] in
                self?.privacyPolicyTapped()
            },
            SettingCellModel(title: "Help / Feedback") { [weak self] in
                self?.helpFeedbackTapped()
            }
        ])
        
        data.append([
            SettingCellModel(title: "Log Out") { [weak self] in
                self?.logoutTapped()
            }
        ])
    }
    
    /// Allow user edit their profile
    private func editProfileTapped() {
        let vc = EditProfileViewController()
        vc.title = "Edit Profile"
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    
    /// Show a share sheet to invite friends
    private func inviteFriendsTapped() {
        // Show a share sheet to invite friends
    }
    
    /// Save original posts
    private func saveOriginalPostsTapped() {
        
    }
    
    // TODO: Later include links to open up terms/privacy/help pages  (part 6)
    
    /// Bring up terms of service
    private func termsOfServiceTapped() {
        
    }
    
    /// Bring up privacy policy
    private func privacyPolicyTapped() {
        
    }
    
    /// Let user ask questions and provide feedback
    private func helpFeedbackTapped() {
        
    }
    
    /// Allow the user to logout
    private func logoutTapped() {
        let actionSheet = UIAlertController(title: "Log Out",
                                            message: "Are you sure you want to log out?",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel",
                                            style: .cancel,
                                            handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: {_ in
            AuthManager.shared.logOut(completion: { success in
                // Do this in the main thread
                DispatchQueue.main.async {
                    if success {
                        // present log in
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true) {
                            // completion section allows the hometab to show up after login again
                            self.navigationController?.popToRootViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                        }
                    } else {
                        // error
                        fatalError("Could not log out user")
                    }
                }
            })
        }))
        
        // Handle use to prevent crash on ipad
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
        present(actionSheet, animated: true)
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = data[indexPath.section][indexPath.row]
        model.handler()
    }
}
