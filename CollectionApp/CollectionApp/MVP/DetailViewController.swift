//
//  DetailViewController.swift
//  CollectionApp
//
//  Created by Артем Соловьев on 18.11.2021.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private let heightOfScreen = UIScreen.main.bounds.height
    private let widthOfScreen = UIScreen.main.bounds.width
    private var coordinates: (Double, Double)?
    private var constantsInPortret = [NSLayoutConstraint]()
    private var constantsInLandscape = [NSLayoutConstraint]()

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
        let label = UILabel()
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
        
        setupPhoto2()
        setupTypeOfAnimal2()
        setupGetPosition2()
        setupInformation2()
        if UIDevice.current.orientation.isLandscape {
            constantsInLandscape.forEach({$0.isActive = true})
        }else{
            constantsInPortret.forEach({$0.isActive = true})
        }
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            print("landscape")
            constantsInPortret.forEach({$0.isActive = false})
            constantsInLandscape.forEach({$0.isActive = true})
        } else {
            print("portret")
            constantsInPortret.forEach({$0.isActive = true})
            constantsInLandscape.forEach({$0.isActive = false})
        }
    }
    
    private func setupPhoto() {
        constantsInPortret.append(imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constantsInPortret.append(imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3))
        constantsInPortret.append(imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3))
        constantsInPortret.append(imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: heightOfScreen/9))
    }

    private func setupTypeOfAnimal() {
        constantsInPortret.append(typeOfAnimal.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constantsInPortret.append(typeOfAnimal.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9))
        constantsInPortret.append(typeOfAnimal.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1))
        constantsInPortret.append(typeOfAnimal.topAnchor.constraint(equalTo: imageView.bottomAnchor))
    }
    
    private func setupGetPosition() {
        constantsInPortret.append(getPosition.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constantsInPortret.append(getPosition.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8))
        constantsInPortret.append(getPosition.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1))
        constantsInPortret.append(getPosition.topAnchor.constraint(equalTo: typeOfAnimal.bottomAnchor))
    }
    
    private func setupInformation() {
        constantsInPortret.append(information.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constantsInPortret.append(information.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8))
        constantsInPortret.append(information.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5))
        constantsInPortret.append(information.topAnchor.constraint(equalTo: getPosition.bottomAnchor))
    }
    
    private func setupPhoto2() {
        constantsInLandscape.append(contentsOf: [imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: widthOfScreen/10),
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/6),
        imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/6),
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: heightOfScreen/9)])
    }
    
    private func setupTypeOfAnimal2() {
        constantsInLandscape.append(contentsOf: [typeOfAnimal.leftAnchor.constraint(equalTo: view.leftAnchor, constant: widthOfScreen/10),
        typeOfAnimal.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/6),
        typeOfAnimal.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1),
        typeOfAnimal.topAnchor.constraint(equalTo: imageView.bottomAnchor)])
    }
    
    private func setupGetPosition2() {
        constantsInLandscape.append(contentsOf: [getPosition.leftAnchor.constraint(equalTo: view.leftAnchor, constant: widthOfScreen/10),
        getPosition.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
        getPosition.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1),
        getPosition.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -heightOfScreen/20)])
    }
    
    private func setupInformation2() {
        constantsInLandscape.append(contentsOf: [information.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: widthOfScreen/10),
        information.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
        information.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
        information.topAnchor.constraint(equalTo: view.topAnchor, constant: heightOfScreen/20)])
    }
}
