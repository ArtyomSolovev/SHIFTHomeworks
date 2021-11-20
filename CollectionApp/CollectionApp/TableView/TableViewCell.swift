//
//  TableViewCell.swift
//  CollectionApp
//
//  Created by Артем Соловьев on 20.11.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let id = "TableViewCell"
    
    var animal: Animal? {
        didSet {
            guard let animal = animal else { return }
            self.imageView?.image = UIImage(named: animal.name)
            self.imageView?.backgroundColor = animal.color
            self.textLabel?.text = animal.name
            self.detailTextLabel?.text = animal.place
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.configureImage()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureImage() {
        self.imageView?.layer.cornerRadius = 12
        self.imageView?.layer.opacity = 0.8
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.frame = .init(x: 10, y: 10, width: 52, height: 52)
        self.textLabel?.frame.origin = .init(x: 80, y: 14)
        self.detailTextLabel?.frame.origin = .init(x: 80, y: 40)
    }
}
