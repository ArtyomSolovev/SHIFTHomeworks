//
//  DetailModel.swift
//  Cars
//
//  Created by Артем Соловьев on 10.12.2021.
//

import Foundation

final class DetailModel {

    private var car: Car
    
    init(car: Car) {
        self.car = car
    }
    
    func getData() -> Car{
        return car
    }
    
}

