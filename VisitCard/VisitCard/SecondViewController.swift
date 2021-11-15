//
//  SecondViewController.swift
//  VisitCard
//
//  Created by Артем Соловьев on 12.11.2021.
//

import UIKit

final class SecondViewController: UIViewController {
    
    private let height = UIScreen.main.bounds.height
    
    private lazy var buttonOne:  UIButton = {
        let view = UIButton()
        view.setTitle("Опыт", for: .normal)
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.addTarget(self, action: #selector(buttonActionOne), for: .touchUpInside)
        return view
    }()
    private lazy var buttonTwo:  UIButton = {
        let view = UIButton()
        view.backgroundColor = .green
        view.setTitle("Языки программирования", for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.addTarget(self, action: #selector(buttonActionTwo), for: .touchUpInside)
        return view
    }()
    private lazy var buttonThree:  UIButton = {
        let view = UIButton()
        view.backgroundColor = .red
        view.setTitle("Ожидания", for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.addTarget(self, action: #selector(buttonActionThree), for: .touchUpInside)
        return view
    }()
    
    private let text : UILabel = {
        let label = UILabel()
        label.text = Conatants.skills.welcome.rawValue
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(buttonOne)
        view.addSubview(buttonTwo)
        view.addSubview(buttonThree)
        view.addSubview(text)
        
        setupButtonOne()
        setupButtonTwo()
        setupButtonThree()
        setupText()
    }
    
    private func setupText() {
        text.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        text.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        text.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
        text.topAnchor.constraint(equalTo: view.topAnchor , constant: height/10).isActive = true
    }
    
    private func setupButtonOne() {
        buttonOne.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonOne.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        buttonOne.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        buttonOne.topAnchor.constraint(equalTo: text.bottomAnchor, constant: height/50).isActive = true
    }

    private func setupButtonTwo() {
        buttonTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonTwo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        buttonTwo.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        buttonTwo.topAnchor.constraint(equalTo: buttonOne.bottomAnchor, constant: height/50).isActive = true
    }
    
    private func setupButtonThree() {
        buttonThree.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonThree.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        buttonThree.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        buttonThree.topAnchor.constraint(equalTo: buttonTwo.bottomAnchor, constant: height/50).isActive = true
    }
    
    @objc private func buttonActionOne(sender: UIButton!) {
        text.text = Conatants.skills.experience.rawValue
    }
    
    @objc private func buttonActionTwo(sender: UIButton!) {
        text.text = Conatants.skills.language.rawValue
    }
    
    @objc private func buttonActionThree(sender: UIButton!) {
        text.text = Conatants.skills.expectations.rawValue
    }
    
}
