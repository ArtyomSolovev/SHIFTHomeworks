//
//  ChooseRouter.swift
//  Cars
//
//  Created by Артем Соловьев on 25.12.2021.
//

import Foundation

protocol IChooseRouter {
    func setRootController(controller: ChooseViewController)
    func setTargerController(controller: DetailViewController)
    func pushDetailVC(with index: Int)
}

final class ChooseRouter {
    private var controller: ChooseViewController?
    private var targetController: DetailViewController?
}

extension ChooseRouter: IChooseRouter {
    
    func setRootController(controller: ChooseViewController) {
        self.controller = controller
    }

    func setTargerController(controller: DetailViewController) {
        self.targetController = controller
    }

    func pushDetailVC(with index: Int) {
        guard let targetController = self.targetController else {
            return
        }
        self.controller?.navigationController?.pushViewController(targetController, animated: true)
    }
}
