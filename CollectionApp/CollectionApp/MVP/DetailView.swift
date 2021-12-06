//
//  DetailView.swift
//  CollectionApp
//
//  Created by Артем Соловьев on 26.11.2021.
//

import UIKit

final class DetailView: UIView {
    
    private var presenter: DetailPresenter?
    
    private let heightOfScreen = UIScreen.main.bounds.height
    private let widthOfScreen = UIScreen.main.bounds.width
    private var constantsInPortret = [NSLayoutConstraint]()
    private var constantsInLandscape = [NSLayoutConstraint]()
    
    var animal: Animal?{
        didSet{
            guard let animal = animal else {return}
            self.backgroundColor = animal.color
            imageView.image = UIImage(named: animal.name)
            typeOfAnimal.text = animal.type.rawValue
            getPosition.setTitle(animal.place, for: .normal)
            information.text = animal.description
        }
    }
    
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
    
    private let getPosition : UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    @objc private func buttonAction(sender: UIButton) {
        self.presenter?.onTouched(animal: animal!)
    }
    
    private let information : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func configureView() {
        self.addSubview(imageView)
        self.addSubview(typeOfAnimal)
        self.addSubview(getPosition)
        self.addSubview(information)
        
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
    
    func loadView(controller: DetailViewController, animal: Animal){
        self.animal = animal
        self.presenter = DetailPresenter()
        self.presenter?.loadView(controller: controller, view: self)
    }
    
    func setPresenter(presenter: DetailPresenter) {
        self.presenter = presenter
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        
        if UIDevice.current.orientation.isLandscape {
            print("landscape")
            self.constantsInPortret.forEach({$0.isActive = false})
            self.constantsInLandscape.forEach({$0.isActive = true})
        } else {
            print("portret")
            constantsInPortret.forEach({$0.isActive = true})
            constantsInLandscape.forEach({$0.isActive = false})
        }
    }
    
    private func setupPhoto() {
        self.constantsInPortret.append(imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor))
        self.constantsInPortret.append(imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3))
        self.constantsInPortret.append(imageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3))
        self.constantsInPortret.append(imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: heightOfScreen/9))
    }
    
    private func setupTypeOfAnimal() {
        self.constantsInPortret.append(typeOfAnimal.centerXAnchor.constraint(equalTo: self.centerXAnchor))
        self.constantsInPortret.append(typeOfAnimal.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9))
        self.constantsInPortret.append(typeOfAnimal.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1))
        self.constantsInPortret.append(typeOfAnimal.topAnchor.constraint(equalTo: imageView.bottomAnchor))
    }
    
    private func setupGetPosition() {
        self.constantsInPortret.append(getPosition.centerXAnchor.constraint(equalTo: self.centerXAnchor))
        self.constantsInPortret.append(getPosition.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8))
        self.constantsInPortret.append(getPosition.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1))
        self.constantsInPortret.append(getPosition.topAnchor.constraint(equalTo: typeOfAnimal.bottomAnchor))
    }
    
    private func setupInformation() {
        self.constantsInPortret.append(information.centerXAnchor.constraint(equalTo: self.centerXAnchor))
        self.constantsInPortret.append(information.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8))
        self.constantsInPortret.append(information.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5))
        self.constantsInPortret.append(information.topAnchor.constraint(equalTo: getPosition.bottomAnchor))
    }
    
    private func setupPhoto2() {
        self.constantsInLandscape.append(contentsOf: [imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: widthOfScreen/10),
                                                      self.imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/6),
                                                      self.imageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/6),
                                                      self.imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: heightOfScreen/9)])
    }
    
    private func setupTypeOfAnimal2() {
        self.constantsInLandscape.append(contentsOf: [typeOfAnimal.leftAnchor.constraint(equalTo: self.leftAnchor, constant: widthOfScreen/10),
                                                      self.typeOfAnimal.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/6),
                                                      self.typeOfAnimal.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1),
                                                      self.typeOfAnimal.topAnchor.constraint(equalTo: imageView.bottomAnchor)])
    }
    
    private func setupGetPosition2() {
        self.constantsInLandscape.append(contentsOf: [self.getPosition.leftAnchor.constraint(equalTo: self.leftAnchor, constant: widthOfScreen/10),
                                                      self.getPosition.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
                                                      self.getPosition.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1),
                                                      self.getPosition.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:  -heightOfScreen/20)])
    }
    
    private func setupInformation2() {
        self.constantsInLandscape.append(contentsOf: [self.information.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: widthOfScreen/10),
                                                      self.information.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
                                                      self.information.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3),
                                                      self.information.topAnchor.constraint(equalTo: self.topAnchor, constant: heightOfScreen/20)])
    }
    
}
