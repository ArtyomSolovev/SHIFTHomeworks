//
//  TherdViewController.swift
//  VisitCard
//
//  Created by Артем Соловьев on 12.11.2021.
//

import UIKit

final class ThirdViewController: UIViewController {
    
    private let height = UIScreen.main.bounds.height
    private var switchOne = false
    private var switchTwo = false
    private var switchThree = false
    
    private lazy var buttonOne:  UIButton = {
        let view = UIButton()
        view.setTitle("Авто", for: .normal)
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.addTarget(self, action: #selector(buttonActionOne), for: .touchUpInside)
        return view
    }()
    
    private lazy var buttonTwo:  UIButton = {
        let view = UIButton()
        view.backgroundColor = .green
        view.setTitle("Спорт", for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.addTarget(self, action: #selector(buttonActionTwo), for: .touchUpInside)
        return view
    }()
    
    private lazy var buttonThree:  UIButton = {
        let view = UIButton()
        view.backgroundColor = .red
        view.setTitle("Игры", for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.addTarget(self, action: #selector(buttonActionThree), for: .touchUpInside)
        return view
    }()
    
    private let text : UILabel = {
        let label = UILabel()
        label.alpha = 0
        label.text = Constants.Hobby.car.rawValue
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let textTwo : UILabel = {
        let label = UILabel()
        label.alpha = 0
        label.text = Constants.Hobby.sport.rawValue
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let textThree : UILabel = {
        let label = UILabel()
        label.alpha = 0
        label.text = Constants.Hobby.games.rawValue
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(buttonOne)
        view.addSubview(buttonTwo)
        view.addSubview(buttonThree)
        view.addSubview(text)
        view.addSubview(textTwo)
        view.addSubview(textThree)
        
        setupButtonOne()
        setupButtonTwo()
        setupButtonThree()
        setupText()
        setupTextTwo()
        setupTextThree()
        
    }
    
    private func setupButtonOne() {
        buttonOne.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonOne.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        buttonOne.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/6).isActive = true
        buttonOne.topAnchor.constraint(equalTo: view.topAnchor, constant: height/20).isActive = true
    }
    private func setupText() {
        text.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        text.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        text.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/6).isActive = true
        text.topAnchor.constraint(equalTo: buttonOne.topAnchor).isActive = true
    }

    private func setupButtonTwo() {
        buttonTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonTwo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        buttonTwo.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/6).isActive = true
        buttonTwo.topAnchor.constraint(equalTo: buttonOne.bottomAnchor, constant: height/50 + height/6).isActive = true
    }
    private func setupTextTwo() {
        textTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textTwo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        textTwo.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/6).isActive = true
        textTwo.topAnchor.constraint(equalTo: buttonTwo.topAnchor).isActive = true
    }
    
    private func setupButtonThree() {
        buttonThree.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonThree.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        buttonThree.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/6).isActive = true
        buttonThree.topAnchor.constraint(equalTo: buttonTwo.bottomAnchor, constant: height/50 + height/6).isActive = true
    }
    private func setupTextThree() {
        textThree.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textThree.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        textThree.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/6).isActive = true
        textThree.topAnchor.constraint(equalTo: buttonThree.topAnchor).isActive = true
    }
    
    @objc private func buttonActionOne(sender: UIButton) {
        if switchOne == false {
            UIView.animate(withDuration: 1, animations:  {
                self.buttonOne.transform = CGAffineTransform(translationX: 0, y: self.height/6)
            }){_ in
                self.text.alpha = 1
            }
        } else{
            UIView.animate(withDuration: 1){
                self.text.alpha = 0
                self.buttonOne.transform = .identity
            }
        }
        switchOne.toggle()
    }
    
    @objc func buttonActionTwo(sender: UIButton) {
        if switchTwo == false {
            UIView.animate(withDuration: 1, animations:  {
                self.buttonTwo.transform = CGAffineTransform(translationX: 0, y: self.height/6)
            }){_ in
                self.textTwo.alpha = 1
            }
        } else{
            UIView.animate(withDuration: 1){
                self.textTwo.alpha = 0
                self.buttonTwo.transform = .identity
            }
        }
        switchTwo.toggle()
    }
    
    @objc func buttonActionThree(sender: UIButton) {
        if switchThree == false {
            UIView.animate(withDuration: 1, animations:  {
                self.buttonThree.transform = CGAffineTransform(translationX: 0, y: self.height/6)
            }){_ in
                self.textThree.alpha = 1
            }
        } else{
            UIView.animate(withDuration: 1){
                self.textThree.alpha = 0
                self.buttonThree.transform = .identity
            }
        }
        switchThree.toggle()
    }

}
