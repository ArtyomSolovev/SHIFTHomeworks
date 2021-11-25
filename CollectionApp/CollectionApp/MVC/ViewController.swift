//
//  ViewController.swift
//  CollectionApp
//
//  Created by Артем Соловьев on 18.11.2021.
//

import UIKit

final class ViewController: UIViewController {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/2-10, height: UIScreen.main.bounds.height/12)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.alwaysBounceVertical = true
        view.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.id)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let animals = Animal.data
    
    override func loadView() {
        view = collectionView
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.animal = animals[indexPath.item]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        animals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.id, for: indexPath) as! CollectionViewCell
        cell.animal = animals[indexPath.item]
        return cell
        
    }
    
}
