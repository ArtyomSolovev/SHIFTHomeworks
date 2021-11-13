//
//  SecondViewController.swift
//  VisitCard
//
//  Created by Артем Соловьев on 12.11.2021.
//

import UIKit

final class SecondViewController: UIViewController {
    
    private lazy var blueView:  UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .blue
        view.tag = 1
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.configureViews()
    }
    
    func configureViews() {
        self.view.addSubview(self.blueView)
    }

}
