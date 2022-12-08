//
//  FitnessPostHeaderTableViewCell.swift
//  FitnessApp
//
//  Created by Daniel Alfonso on 12/7/22.
//

import UIKit

class FitnessPostHeaderTableViewCell: UITableViewCell {

    static let identifier = "FitnessPostHeaderTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        // configure the cell
    }

}
