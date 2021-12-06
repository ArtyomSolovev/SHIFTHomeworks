//
//  Model.swift
//  CollectionApp
//
//  Created by Артем Соловьев on 25.11.2021.
//

import Foundation

final class Model {
    
    private var animals = Animal.data
    
    func getData() -> [Animal]{
        return animals
    }
}
