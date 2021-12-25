//
//  ChoosePresenter.swift
//  Cars
//
//  Created by Артем Соловьев on 10.12.2021.
//

import Foundation

protocol IChoosePresenter{
    func loadView(controller: ChooseViewController, view: IChooseView)
}

final class ChoosePresenter {
    private let model: IChooseModel
    private let router: IChooseRouter
    private weak var controller: ChooseViewController?
    private weak var view: IChooseView?
    
    init(model: IChooseModel, router: IChooseRouter) {
        self.model = model
        self.router = router as! ChooseRouter
    }
    
    private func setHandlers(){
        view?.getNumberOfRowsHandler = { [weak self] in
            (self?.model.getData().count) ?? 0
        }
        view?.getContentForCellHandler = { [weak self] index in
            (self?.model.getData()[index])!
        }
        view?.onTouchedHandler = { [weak self] index in
            self?.router.pushDetailVC(with: index)
        }
    }
    
}

extension ChoosePresenter: IChoosePresenter {
    func loadView(controller: ChooseViewController, view: IChooseView) {
        self.controller = controller
        self.view = view
        self.setHandlers()
    }
}
