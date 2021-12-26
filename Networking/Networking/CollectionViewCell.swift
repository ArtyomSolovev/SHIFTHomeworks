//
//  CollectionViewCell.swift
//  Networking
//
//  Created by Артем Соловьев on 26.12.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let id = "CollectionViewCell"

    private var imageView : UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    func setPhoto(photo: UIImage){
        self.imageView.image = photo
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureContentLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureContentLayout() {
        self.addSubview(imageView)
        setupPhoto()
    }
    
    private func setupPhoto() {
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

}
