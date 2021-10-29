//
//  main.swift
//  CarsWeekOne
//
//  Created by Артем Соловьев on 29.10.2021.
//

import Foundation

var cars: [Car]
var x: Int?

repeat{
    print("""
1. Добавление нового автомобиля
2. Вывод списка добавленных автомобилей
3. Вывод списка автомобилей с использованием фильтра по типу
кузова
""")
    x = Int(readLine() ?? "0")
    switch x {
    case 1:
        print("Введите производтеля")
        let manufacturer = readLine()
        print("Введите модел")
        let model = readLine()
        print("Введите тип кузова")
        let body = readLine()
        print("Введите год выпуска")
        let yearOfIssue = Int(readLine() ?? "-")
        print("Введите государственный номер")
        let manufaccarNumberturer = readLine()
        
    
    default: break
    }
} while(x != 0)
