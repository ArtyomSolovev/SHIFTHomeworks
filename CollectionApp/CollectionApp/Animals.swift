//
//  Animals.swift
//  CollectionApp
//
//  Created by Артем Соловьев on 18.11.2021.
//

import Foundation

struct Animal {
    let name: String?
    let description: String?
    let place: String?
    let coordinates: (Double, Double)?
    let type: TypeOfAnimal?
}

extension Animal {
    enum TypeOfAnimal {
        case predator
        case herbivore
    }
    static var data: [Self]{
        let one = Animal(name: "Медведь", description: "Средняя длина тела бурого медведя составляет 1-2 метра, высота достигает 1 метра, вес находится в пределах 300-400 кг. В целом подвиды могут значительно варьировать в длине тела и массе, но самцы всегда крупнее, чем самки.", place: "", coordinates: (55.757962, 55.757962), type: .predator)
        let two = Animal(name: "Волк", description: "Волк, обыкновенный или серый, принадлежит к хищным млекопитающим семейства псовые (Canidae). Среди животных этого семейства волк является самым крупным: в длину тело около 160 см, хвост достигает 52 см, высота около 90 см, вес тела 80 кг.", place: "", coordinates: (55.757962, 55.757962), type: .predator)
        return [one, two]
    }
}
