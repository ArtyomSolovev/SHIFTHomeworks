//
//  DetailPresenter.swift
//  Cars
//
//  Created by Артем Соловьев on 10.12.2021.
//

class DetailPresenter {
    
    private var viewDeatail: DetailView?
    private var controllerDetail: DetailViewController?
    
    func loadView(controller: DetailViewController, model: DetailModel, view: DetailView){
        self.controllerDetail = controller
        self.viewDeatail = view
        self.viewDeatail?.setPresenter(presenter: self, model: model)
        let viewModel = model.getData()
        self.viewDeatail?.update(data: viewModel)
    }
}
