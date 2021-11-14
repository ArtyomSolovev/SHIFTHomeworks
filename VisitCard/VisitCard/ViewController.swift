//
//  ViewController.swift
//  VisitCard
//
//  Created by Артем Соловьев on 12.11.2021.
//

import UIKit

final class ViewController: UIViewController {
    
    private let height = UIScreen.main.bounds.height
    private let width = UIScreen.main.bounds.width

    private let imageView : UIImageView = {
        let image = UIImageView(image: UIImage(named: Conatants.aboutMe.photo.rawValue))
        image.layer.cornerRadius = 50
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let briefInformation : UILabel = {
        let label = UILabel()
        label.text = Conatants.aboutMe.briefInformation.rawValue
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let fullInformationStart : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000))
        label.text = Conatants.aboutMe.fullInformationStart.rawValue
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let fullInformationEnd : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000))
        label.text = Conatants.aboutMe.fullInformationEnd.rawValue
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(briefInformation)
        view.addSubview(fullInformationStart)
        view.addSubview(fullInformationEnd)
        
        setupPhoto()
        setupBriefInfo()
        setupFullInformationStart()
        setupFullInformationEnd()
    }

    func setupPhoto() {
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: height/9).isActive = true
    }

    func setupBriefInfo() {
        briefInformation.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        briefInformation.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        briefInformation.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1).isActive = true
        briefInformation.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
    }
    
    func setupFullInformationStart() {
        fullInformationStart.alpha = 0
        fullInformationStart.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -width/10).isActive = true
        fullInformationStart.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        fullInformationStart.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        fullInformationStart.topAnchor.constraint(equalTo: briefInformation.bottomAnchor).isActive = true
        DispatchQueue.main.async {
            UIView.animate(withDuration: 1) {
                self.fullInformationStart.transform = CGAffineTransform(translationX: self.width/10, y: 0)
                self.fullInformationStart.alpha = 1
            }
        }
    }
    
    func setupFullInformationEnd() {
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

