//
//  ViewController.swift
//  CollectionApp
//
//  Created by Артем Соловьев on 18.11.2021.
//

import UIKit

final class Controller: UIViewController {
    
    private var customView: View?
    private var customModel: Model?
    private var animals = [Animal]()
    
    init(){
        self.customView = View(frame: UIScreen.main.bounds)
        self.customModel = Model()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        customView?.load(controller: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        customView?.backgroundColor = .lightGray
        if let customView = customView {
            self.view.addSubview(customView)
        }
        self.animals = customModel?.getData() ?? [Animal]()
        customView?.configure()
        customView?.collectionView.delegate = self
        customView?.collectionView.dataSource = self
    }
}


extension Controller: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.animal = animals[indexPath.item]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension Controller: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.id, for: indexPath) as! CollectionViewCell
        cell.animal = animals[indexPath.item]
        return cell
        
    }
    
}
