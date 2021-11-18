//
//  ViewController.swift
//  CollectionApp
//
//  Created by Артем Соловьев on 18.11.2021.
//

import UIKit
import MapKit

final class ViewController: UIViewController {

    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero)
        view.alwaysBounceVertical = true
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .cyan
    }

}

extension ViewController: UICollectionViewDelegate{
    
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
