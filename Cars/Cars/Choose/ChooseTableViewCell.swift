//
//  ChooseTableViewCell.swift
//  Cars
//
//  Created by Артем Соловьев on 10.12.2021.
//

import UIKit

protocol IChooseTableViewCell: UITableViewCell {
    func setCar(car: Car)
}

final class ChooseTableViewCell: UITableViewCell {
    
    static let identifier = "ChooseTableViewCell"

    // MARK: UI
    
    private let image : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "car")
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let name : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let article : UILabel = {
        let label = UILabel()
        label.text = "Выбрать"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    var car: Car? {
        didSet {
            guard let person = car else { return }
            self.image.image = UIImage(named: person.image + "1")
            self.name.text = person.title
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
        self.addSubview(name)
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
        self.name.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 82).isActive = true
        self.name.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.article.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24).isActive = true
        self.article.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}

extension ChooseTableViewCell: IChooseTableViewCell{
    
    func setCar(car: Car) {
        self.car = car
    }
    
}
