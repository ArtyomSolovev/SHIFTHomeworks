//
//  ViewController.swift
//  Cars
//
//  Created by Артем Соловьев on 10.12.2021.
//

import UIKit

final class ChooseViewController: UIViewController {

    private let viewChoose: IChooseView
    private let presenter: ChoosePresenter
    
    init(presenter: IChoosePresenter){
        self.viewChoose = ChooseView(frame:UIScreen.main.bounds)
        self.presenter = presenter as! ChoosePresenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.presenter.loadView(controller: self, view: self.viewChoose)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Helvetica Neue", size: 25)!]
        self.title = "Выберите"
        self.view.addSubview(viewChoose)
    }
}
