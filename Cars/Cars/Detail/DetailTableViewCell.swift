//
//  DetailTableViewCell.swift
//  Cars
//
//  Created by Артем Соловьев on 12.12.2021.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    static let identifier = "DetailTableViewCell"

    // MARK: UI
    
    private let name : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let checkbox : CheckBox = {
        let label = CheckBox()
        label.isChecked = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setName(name: String) {
        self.name.text = name
    }
    
    var post: Car? {
        didSet {
            guard let person = post else { return }
            self.name.text = person.title
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.initialSetup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initialSetup() {
        self.addSubview(name)
        self.addSubview(checkbox)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.name.leftAnchor.constraint(equalTo: self.leftAnchor, constant: self.bounds.width/10).isActive = true
        self.name.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.checkbox.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24).isActive = true
        self.checkbox.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}

