//
//  DetailPresenter.swift
//  CollectionApp
//
//  Created by Артем Соловьев on 26.11.2021.
//

final class DetailPresenter {
    
    private let model = DetailModel()
    private weak var controller: DetailViewController?
    private weak var view: DetailView?
    
    func loadView(controller: DetailViewController, view: DetailView) {
        self.controller = controller
        self.view = view
        self.view?.setPresenter(presenter: self)
    }
    
    func onTouched(animal: Animal) {
        let VC = MapViewController()
        VC.animal = animal
        self.controller?.present(VC, animated: true, completion: nil)
    }
}
