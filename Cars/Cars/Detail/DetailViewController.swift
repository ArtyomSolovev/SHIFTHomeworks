//
//  DetailViewController.swift
//  Cars
//
//  Created by Артем Соловьев on 10.12.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var postView: DetailView?
    private var postModel: DeatailModel?

    init(car: Car) {
        self.postView = DetailView(frame: UIScreen.main.bounds)
        self.postModel = DeatailModel(car: car)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        self.postView?.loadView(controller: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel = postModel?.getData() else { return }
        postView?.update(data: viewModel)
    }

    override func viewDidAppear(_ animated: Bool) {
        self.postView?.configView()
        if let customView = postView {
            self.view.addSubview(customView)
        }
    }

}
