//
//  EditProfileViewController.swift
//  FitnessApp
//
//  Created by Daniel Alfonso on 12/8/22.
//

import UIKit

struct EditProfileFormModel {
    let label: String
    let placeHolder: String
    var value: String?
}

final class EditProfileViewController: UIViewController, UITableViewDataSource {

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FormTableViewCell.self, forCellReuseIdentifier: FormTableViewCell.identifier)
        return tableView
    }()
    
    private var models = [[EditProfileFormModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        tableView.tableHeaderView = createTableHeaderView()
        tableView.dataSource = self
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(saveTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(cancelTapped))
    }
    
    // create an array for the first sections with models in them
    // fill that array with those models, then append that to the models variable
    private func configureModels() {
        // name, username, bio
        let firstSection = ["Name", "Username", "Bio"]
        var firstModelsSection = [EditProfileFormModel]()
        for label in firstSection {
            let model = EditProfileFormModel(label: label, placeHolder: "Enter \(label)...", value: nil)
            firstModelsSection.append(model)
        }
        models.append(firstModelsSection)
        
        // email, phone, gender
        let secondSection = ["Email", "Phone", "Gender"]
        var secondModelsSections = [EditProfileFormModel]()
        for label in secondSection {
            let model = EditProfileFormModel(label: label, placeHolder: "Enter \(label)...", value: nil)
            secondModelsSections.append(model)
        }
        models.append(secondModelsSections)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    // MARK: - TableView
    
    func createTableHeaderView() -> UIView {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.height/4).integral)
        let profilePhotoSize = header.height/1.5
        let profilePhotoButton = UIButton(frame: CGRect(x: (view.width-profilePhotoSize)/2,
                                                        y: (header.height-profilePhotoSize)/2,
                                                        width: profilePhotoSize,
                                                        height: profilePhotoSize))
        header.addSubview(profilePhotoButton)
        profilePhotoButton.layer.masksToBounds = true
        profilePhotoButton.layer.cornerRadius = profilePhotoSize/2.0
        profilePhotoButton.tintColor = .label
        profilePhotoButton.addTarget(self,
                                     action: #selector(profilePhotoButtonTapped),
                                     for: .touchUpInside)
        
        profilePhotoButton.setBackgroundImage(UIImage(systemName: "person.circle"), for: .normal)
        profilePhotoButton.layer.borderWidth = 1
        profilePhotoButton.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        return header;
    }
    
    @objc private func  profilePhotoButtonTapped() {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: FormTableViewCell.identifier, for: indexPath) as! FormTableViewCell
        cell.configureCell(with: model)
        cell.textLabel?.text = model.label
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section == 1 else {
            return nil
        }
        return "Private Information"
    }
    
    // MARK: - Action
    
    @objc private func saveTapped() {
        // Save the information to the database
    }
    
    @objc private func cancelTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func changeProfilePictureTapped() {
        let actionSheet = UIAlertController(title: "Profile Picture",
                                            message: "Change Profile Picture",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose from Library", style: .default, handler: { _ in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        // Handles ipad crashing
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        
        present(actionSheet, animated: true)
    }

}
