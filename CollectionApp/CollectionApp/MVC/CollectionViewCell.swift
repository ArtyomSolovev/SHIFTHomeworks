//
//  CollectionViewCell.swift
//  CollectionApp
//
//  Created by Артем Соловьев on 18.11.2021.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {
    
    static let id = "CollectionViewCell"

    private var imageView : UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 25
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let placeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setAnimal(animal: Animal){
        self.imageView.image = UIImage(named: animal.name)
        self.nameLabel.text = animal.name
        self.placeLabel.text = animal.place
        backgroundColor = animal.color
    }
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.25) {
                self.alpha = self.isHighlighted ? 0.5 : 1.0
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureContentLayout()
        self.configureLayer()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureContentLayout() {
        self.addSubview(imageView)
        self.addSubview(nameLabel)
        self.addSubview(placeLabel)
        setupPhoto()
        setupName()
        setupPlace()
    }
    
    private func setupPhoto() {
        imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/4).isActive = true
        imageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1/4).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func setupName(){
        nameLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    private func setupPlace(){
        placeLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor).isActive = true
        placeLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2).isActive = true
        placeLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2).isActive = true
        placeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
    }
    
    private func configureLayer() {
        layer.cornerRadius = frame.height / 2
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 1
    }

}
