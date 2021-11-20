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
    var type: TypeOfAnimal
    let color: UIColor
}

extension Animal {
    enum TypeOfAnimal: String {
        case predator = "Хищник"
        case herbivore = "Травоядное"
    }
    static var data: [[Self]]{
        let one = Animal(name: "Медведь", description: "Средняя длина тела бурого медведя составляет 1-2 метра, высота достигает 1 метра, вес находится в пределах 300-400 кг. В целом подвиды могут значительно варьировать в длине тела и массе, но самцы всегда крупнее, чем самки.", place: "Россия", coordinates: (60.757962, 100.757962), type: .predator, color: .brown)
        let two = Animal(name: "Волк", description: "Волк, обыкновенный или серый, принадлежит к хищным млекопитающим семейства псовые (Canidae). Среди животных этого семейства волк является самым крупным: в длину тело около 160 см, хвост достигает 52 см, высота около 90 см, вес тела 80 кг.", place: "Казахстан", coordinates: (48.757962, 68.757962), type: .predator, color: .white)
        let three = Animal(name: "Тигр", description: "Самые крупные – это бенгальские и амурские тигры. Самцы в длину от 2,3 до 2,5 м, с массой тела около 300 кг. Высота в холке достигает 1,15 м. Самки обычно уступают самцам в размерах.", place: "Индия", coordinates: (20.757962, 75.757962), type: .predator, color: .orange)
        let four = Animal(name: "Жираф", description: "Высота самца жирафа от 5,5 до 6,1 м (примерно треть этой длины составляет шея), его вес находится в пределах 900-1200 кг. Самки обычно немного меньше по размерам и весу. Шея у жирафа удивительно длинная, несмотря на то, что она состоит, как и у прочих млекопитающих, всего только из семи позвонков. ", place: "Сахара", coordinates: (23, 12.36), type: .herbivore, color: .yellow)
        let five = Animal(name: "Бегемот", description: "Бегемоты являются одними из самых больших наземных животных. Средний вес самцов около 1600 кг, для самок этот показатель равен 1400 кг. Высота достигает 1,65 м. Длина тела от 3 до 5 м. Длина хвоста 55-60 см.", place: "Африка", coordinates: (-29.965050, 24.4864600), type: .herbivore, color: .purple)
        let six = Animal(name: "Крокодил", description: "Длина большинства крокодилов 2—5,5 м. Их внешность демонстрирует адаптацию к обитанию в водной среде. Глаза с вертикально-щелевидным зрачком расположены на верхней части головы, так что животное может выглядывать из воды, выставляя наружу только ноздри и глаза.", place: "Австралия", coordinates: (-20.757962, 140.757962), type: .predator, color: .green)
        let seven = Animal(name: "Олень", description: "Высота северного оленя в холке около 1,5 м, тело продолговатой формы, его длина составляет около 220 см. Масса животных от 100 до 220 кг. Размеры самок всегда меньше, чем самцов.", place: "Канада", coordinates: (60, -95), type: .herbivore, color: .darkGray)
        let eight = Animal(name: "Слон", description: "Высота слона 2 — 4 м. Вес слона — от 3 до 7 тонн. Слоны в Африке, особенно саванные, нередко имеют массу до 10 — 12 тонн. Могучее тело слона покрыто толстой (до 2, 5 см) кожей бурого или серого цвета с глубокими морщинами.", place: "Индия", coordinates: (26.517962, 80.757962), type: .herbivore, color: .blue)
        let nine = Animal(name: "Дельфин", description: "Тело сверху и плавники окрашены в серовато- или зеленовато-чёрный цвет, брюхо белого цвета, кожа гладкая и блестящая. Длина тела около 2 м, спинной плавник 80 см высотой, ширина грудных плавников 15-18 см, длина 55-60 см. Обитает в морях северного полушария, живет стаями по 10, 100 и до 1000 особей.", place: "Моря", coordinates: (43, 34), type: .predator, color: .lightGray)
        let ten = Animal(name: "Орангутан", description: "Орангутан – это крупнейшая древесная обезьяна. Рост взрослых самцов достигает 1,5 м, вес тела составляет 50-90. Самки обычно гораздо меньше: до 1 м ростом с весом от 30 до 50 кг. Калимантанские орангутаны крупнее суматранских. Телосложение массивное, с сильно развитой мускулатурой. Задние ноги короткие, передние – очень длинные, достигают лодыжек. ", place: "Калимантан", coordinates: (1, 114), type: .herbivore, color: .red)
        let notSortesArray = [ten , three, four, six, eight, five, two, nine, seven, one]
        
        var animalsOne = [Animal]()
        var animalsTwo = [Animal]()
        for item in notSortesArray {
            if item.type == .predator {
                animalsOne.append(item)
            }else{
                animalsTwo.append(item)
            }
        }
        
        let animals = [animalsOne,animalsTwo]
        
        
        return animals
    }
}
