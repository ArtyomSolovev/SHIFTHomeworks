//
//  Animals.swift
//  CollectionApp
//
//  Created by Артем Соловьев on 18.11.2021.
//

import Foundation
import UIKit

struct Animal {
    let name: String
    let description: String
    let place: String
    let coordinates: (Double, Double)
    let type: TypeOfAnimal
    let color: UIColor
}

extension Animal {
    enum TypeOfAnimal: String {
        case predator = "Хищник"
        case herbivore = "Траваядное"
    }
    static var data: [Self]{
        let one = Animal(name: "Медведь", description: "Средняя длина тела бурого медведя составляет 1-2 метра, высота достигает 1 метра, вес находится в пределах 300-400 кг. В целом подвиды могут значительно варьировать в длине тела и массе, но самцы всегда крупнее, чем самки.", place: "Россия", coordinates: (60.757962, 100.757962), type: .predator, color: .brown)
        let two = Animal(name: "Волк", description: "Волк, обыкновенный или серый, принадлежит к хищным млекопитающим семейства псовые (Canidae). Среди животных этого семейства волк является самым крупным: в длину тело около 160 см, хвост достигает 52 см, высота около 90 см, вес тела 80 кг.", place: "Казахстан", coordinates: (48.757962, 68.757962), type: .predator, color: .white)
        let three = Animal(name: "Тигр", description: "Самые крупные – это бенгальские и амурские тигры. Самцы в длину от 2,3 до 2,5 м, с массой тела около 300 кг. Высота в холке достигает 1,15 м. Самки обычно уступают самцам в размерах.", place: "Индия", coordinates: (20.757962, 75.757962), type: .predator, color: .orange)
        return [one, two, three]
    }
}
