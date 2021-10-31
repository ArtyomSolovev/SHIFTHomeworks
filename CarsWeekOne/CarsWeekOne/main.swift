//
//  main.swift
//  CarsWeekOne
//
//  Created by Артем Соловьев on 29.10.2021.
//

import Foundation

var cars = [Car]()
var option: Int?

func run(){
    repeat{
        print("""
        
        1. Добавление нового автомобиля
        2. Вывод списка добавленных автомобилей
        3. Вывод списка автомобилей с использованием фильтра по типу кузова \n
        """)
        option = Int(readLine() ?? "0")
        switch option {
        case 1:
            addAuto()
        case 2:
            showAuto()
        case 3:
            showAuto2()
        default:
            option = 0
        }
    } while(option != 0)
}

func addAuto() {
    print("Введите производтеля")
    let manufacturer = readLine()
    print("Введите модел")
    let model = readLine()
    print("Выберите тип кузова: 1)Седан 2)Кроссовер 3)Купе 4)Фургон 5)Хэтчбек 6)Пикап")
    let body = Body.Unknown.getTypeOfBody(number: Int(readLine() ?? "0") ?? 0)
    print("Введите год выпуска")
    let yearOfIssue = Int(readLine() ?? "-")
    print("Введите государственный номер")
    let carNumber = readLine()
    cars.append(Car(manufacturer: manufacturer ?? "None", model: model ?? "None", body: body, yearOfIssue: yearOfIssue, carNumber: carNumber))
}

func showAuto(){
    cars.forEach{print($0.description)}
}

func showAuto2(){
    print("Выберите машины с каким типом кузова хотите увидеть:")
    for (x , y) in Body.allCases.enumerated(){
        print("\(x) - \(y.rawValue)")
    }
    let body = Body.Unknown.getTypeOfBody(number: Int(readLine() ?? "0") ?? 0)
    cars.filter { $0.body == body}.map{ $0.description}.forEach{print($0)}
    
}
run()
