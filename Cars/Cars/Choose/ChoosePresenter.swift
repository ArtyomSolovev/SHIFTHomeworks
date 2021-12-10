//
//  ChoosePresenter.swift
//  Cars
//
//  Created by Артем Соловьев on 10.12.2021.
//

import Foundation

class ChoosePresenter {
    
    private let model = ChooseModel()
    private weak var controller: ChooseViewController?
    private weak var view: ChooseView?
    
    func loadView(controller: ChooseViewController, view: ChooseView) {
        self.controller = controller
        self.view = view
        self.view?.setPresenter(presenter: self)
    }
}
