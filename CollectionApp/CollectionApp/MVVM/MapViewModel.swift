//
//  MapViewModel.swift
//  CollectionApp
//
//  Created by Артем Соловьев on 05.12.2021.
//

import Foundation

final class Observable<T> {
    var data: T {
        didSet {
            self.notify?(self.data)
        }
    }
    
    private var notify: ((T) -> Void)?
    
    init(data: T){
        self.data = data
    }
    
    func setNotify(notify: ((T) -> Void)?) {
        self.notify = notify
    }
}

final class MapViewModel{
    
    private weak var controller: MapViewController?
    private weak var view: MapView?
    private let model = MapModel()
    var updateDataHandler: ((String, (Double, Double)) -> Void)?
    var data: Observable<(String , (Double, Double))> = Observable<(String , (Double, Double))>(data: ("String", (0, 0)))

    init(){
        self.updateModel()
    }
    
    func loadView(controller: MapViewController, view: MapView) {
        self.view = view
        self.controller = controller
    }
    
    func onTouchedDismiss(coordinates: (Double, Double)) {
        self.controller?.dismiss(animated: true, completion: nil)
    }

    func updateModel() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 6) { [weak self] in
            self?.model.setData(animal: "Снежный человек", coordinates: (28,83))
            DispatchQueue.main.async { [weak self] in
                let viewData = self?.model.getData()
                self?.data.data = viewData ?? ("String", (0, 0))
            }
        }
    }
    

}
