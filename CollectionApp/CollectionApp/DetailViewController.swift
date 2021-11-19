//
//  DetailViewController.swift
//  CollectionApp
//
//  Created by Артем Соловьев on 18.11.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let height = UIScreen.main.bounds.height
    private let width = UIScreen.main.bounds.width
    private var coordinates: (Double, Double)?

    private let imageView : UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 50
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let typeOfAnimal : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var getPosition : UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonAction(sender: UIButton) {
        let VC = MapViewController()
        VC.place = self.title
        VC.coordinates = coordinates
        self.present(VC, animated: true, completion: nil)
    }
    
    private let information : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000))
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var animal: Animal?{
        didSet{
            guard let animal = animal else {return}
            self.title = animal.name
            view.backgroundColor = animal.color
            imageView.image = UIImage(named: animal.name)
            typeOfAnimal.text = animal.type.rawValue
            getPosition.setTitle(animal.place, for: .normal)
            information.text = animal.description
            coordinates = animal.coordinates
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        view.addSubview(typeOfAnimal)
        view.addSubview(getPosition)
        view.addSubview(information)
        
        setupPhoto()
        setupTypeOfAnimal()
        setupGetPosition()
        setupInformation()
    }
    
    private func setupPhoto() {
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: height/9).isActive = true
    }

    private func setupTypeOfAnimal() {
        typeOfAnimal.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        typeOfAnimal.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        typeOfAnimal.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1).isActive = true
        typeOfAnimal.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
    }
    
    private func setupGetPosition() {
        getPosition.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        getPosition.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        getPosition.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1).isActive = true
        getPosition.topAnchor.constraint(equalTo: typeOfAnimal.bottomAnchor).isActive = true
    }
    
    private func setupInformation() {
        information.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        information.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        information.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        information.topAnchor.constraint(equalTo: getPosition.bottomAnchor).isActive = true
    }
    
    
}
