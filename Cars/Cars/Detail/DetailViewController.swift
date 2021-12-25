//
//  DetailViewController.swift
//  Cars
//
//  Created by Артем Соловьев on 10.12.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var viewDetail: DetailView?
    private var postModel: DetailModel?

    init(car: Car) {
        self.viewDetail = DetailView(frame: UIScreen.main.bounds)
        self.postModel = DetailModel(car: car)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        self.viewDetail?.loadView(controller: self, model: postModel!)
    }

    override func viewDidAppear(_ animated: Bool) {
        self.viewDetail?.configView()
        if let customView = viewDetail {
            self.view.addSubview(customView)
        }
        viewDetail?.configView()
    }

}
