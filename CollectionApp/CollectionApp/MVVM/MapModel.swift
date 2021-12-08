//
//  MapModel.swift
//  CollectionApp
//
//  Created by Артем Соловьев on 05.12.2021.
//

import Foundation

final class MapModel {
    
    private var animal: String?
    private var coordinates: (Double, Double)?
    
    func getData() -> (String, (Double, Double)) {
        return (animal ?? " ", coordinates ?? (0,0))
    }
    
    func setData(animal: String, coordinates: (Double, Double)) {
            self.animal = animal
        self.coordinates = coordinates
    }
    
}
