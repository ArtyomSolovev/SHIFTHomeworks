//
//  ChooseModel.swift
//  Cars
//
//  Created by Артем Соловьев on 10.12.2021.
//

import Foundation

protocol IChooseModel {
    func getData() -> [Car]
}

final class ChooseModel {
    private var someData = Car.sampleData
}

extension ChooseModel: IChooseModel {

    
    func getData() -> [Car]{
        return someData
    }
    
}

