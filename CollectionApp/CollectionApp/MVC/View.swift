//
//  View.swift
//  CollectionApp
//
//  Created by Артем Соловьев on 25.11.2021.
//

import UIKit

final class View: UIView {

    private weak var controller: Controller?
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/2-10, height: UIScreen.main.bounds.height/12)
        let view = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        view.alwaysBounceVertical = true
        view.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.id)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func load(controller: Controller) {
        self.controller = controller
    }
    
    func configure() {
        self.addSubview(self.collectionView)
    }
}
