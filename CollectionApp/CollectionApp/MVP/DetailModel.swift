//
//  ModelDetail.swift
//  CollectionApp
//
//  Created by Артем Соловьев on 26.11.2021.
//

import Foundation

final class DetailModel {
    
    private var animals = Animal.data
    
    func getData() -> [Animal]{
        return self.animals
    }
    
}
