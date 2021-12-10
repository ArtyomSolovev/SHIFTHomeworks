//
//  ChooseTableViewCell.swift
//  Cars
//
//  Created by Артем Соловьев on 10.12.2021.
//

import UIKit

class ChooseTableViewCell: UITableViewCell {
    
    static let identifier = "ChooseTableViewCell"

    // MARK: UI
    
    private let image : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "car")
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let header : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let article : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    var post: Car? {
        didSet {
            guard let person = post else { return }
            self.image.image = UIImage(named: person.image)
            self.header.text = person.title
            self.article.text = person.article
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.initialSetup()
        self.configureImage()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initialSetup() {
        self.addSubview(image)
        self.addSubview(header)
        self.addSubview(article)
    }

    private func configureImage() {
        self.image.layer.cornerRadius = 8
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.image.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        self.image.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.image.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.image.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.header.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 82).isActive = true
        self.header.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        self.article.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 82).isActive = true
        self.article.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24).isActive = true
        self.article.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 8).isActive = true
        self.article.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
    }
}
