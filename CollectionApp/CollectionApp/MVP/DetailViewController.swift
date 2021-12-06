//
//  DetailViewController.swift
//  CollectionApp
//
//  Created by Артем Соловьев on 18.11.2021.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private var viewDetal: DetailView?
    var animal: Animal?
    
    init(){
        self.viewDetal = DetailView(frame: UIScreen.main.bounds)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.viewDetal?.loadView(controller: self, animal: self.animal!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.title = animal?.name
        self.viewDetal?.configureView()
        if let viewDetal = viewDetal{
        self.view.addSubview(viewDetal)
        }
    }
    
}
