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
    
    private let briefInformation : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var fullInformationStart : UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonAction(sender: UIButton!) {
        let VC = MapViewController()
        VC.place = self.title
        VC.coordinates = coordinates
        self.present(VC, animated: true, completion: nil)
    }
    
    private let fullInformationEnd : UILabel = {
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
            briefInformation.text = animal.type.rawValue
            fullInformationStart.setTitle(animal.place, for: .normal)
            fullInformationEnd.text = animal.description
            coordinates = animal.coordinates
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        view.addSubview(briefInformation)
        view.addSubview(fullInformationStart)
        view.addSubview(fullInformationEnd)
        
        setupPhoto()
        setupBriefInfo()
        setupFullInformationStart()
        setupFullInformationEnd()
    }
    
    private func setupPhoto() {
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: height/9).isActive = true
    }

    private func setupBriefInfo() {
        briefInformation.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        briefInformation.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        briefInformation.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1).isActive = true
        briefInformation.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
    }
    
    private func setupFullInformationStart() {
        fullInformationStart.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -width/10).isActive = true
        fullInformationStart.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        fullInformationStart.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        fullInformationStart.topAnchor.constraint(equalTo: briefInformation.bottomAnchor).isActive = true
    }
    
    private func setupFullInformationEnd() {
        fullInformationEnd.alpha = 0
        fullInformationEnd.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: width/10).isActive = true
        fullInformationEnd.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        fullInformationEnd.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        fullInformationEnd.topAnchor.constraint(equalTo: fullInformationStart.bottomAnchor).isActive = true
        DispatchQueue.main.async {
            UIView.animate(withDuration: 1) {
                self.fullInformationEnd.transform = CGAffineTransform(translationX: -self.width/10, y: 0)
                self.fullInformationEnd.alpha = 1
            }
        }
    }
    
    
}
