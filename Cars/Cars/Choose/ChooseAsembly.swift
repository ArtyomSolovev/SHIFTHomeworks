//
//  ChooseAsembly.swift
//  Cars
//
//  Created by Артем Соловьев on 19.12.2021.
//

import UIKit

final class ChooseAsembly {
    static func build() -> UIViewController {
        let model = ChooseModel()
        let router = ChooseRouter()
        
        let presenter = ChoosePresenter(model: model, router: router)
        let controller = ChooseViewController(presenter: presenter)
        
        let data = model.getData()
        
        let targetController = DetailViewController(car: data[1])
        
        router.setRootController(controller: controller )
        router.setTargerController(controller: targetController)
        
        return controller
    }
}
