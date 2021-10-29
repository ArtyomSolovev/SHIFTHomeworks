//
//  main.swift
//  CarsWeekOne
//
//  Created by Артем Соловьев on 29.10.2021.
//

import Foundation

var cars = [Car]()
var x: Int?

print("""
1. Добавление нового автомобиля
2. Вывод списка добавленных автомобилей
3. Вывод списка автомобилей с использованием фильтра по типу кузова \n
""")

func getTypeOfBody(number:Int) -> Body{
    switch Int(number) {
    case 1:
        return Body.Sedan
    case 2:
        return Body.SUV
    case 3:
        return Body.Coupe
    case 4:
        return Body.Van
    case 5:
        return Body.Hatchback
    case 6:
        return Body.Pickup
    default:
        return Body.none
    }
}

repeat{
    x = Int(readLine() ?? "0")
    switch x {
    case 1:
        print("Введите производтеля")
        let manufacturer = readLine()
        print("Введите модел")
        let model = readLine()
        print("Выберите тип кузова: 1)Седан 2)Кроссовер 3)Купе 4)Фургон 5)Хэтчбек 6)Пикап")
        let body = getTypeOfBody(number: Int(readLine() ?? "1")!)
        print("Введите год выпуска")
        let yearOfIssue = Int(readLine() ?? "-")
        print("Введите государственный номер")
        let carNumber = readLine()
        cars.append(Car(manufacturer: manufacturer!, model: model!, body: body, yearOfIssue: yearOfIssue, carNumber: carNumber))
    case 2:
        for car in cars {
            print("\n Производитель:", car.manufacturer, "\n Модель:", car.model, "\n Тип кузова:", car.body.rawValue, "\n Год выпуска:", car.yearOfIssue ?? "-")
            if let carNumber = car.carNumber {
                print(" Государственный номер:", carNumber)
            }
        }
    case 3:
        print("Выберите машины с каким типом кузова хотите увидеть: 1)Седан 2)Кроссовер 3)Купе 4)Фургон 5)Хэтчбек 6)Пикап")
        let body = getTypeOfBody(number: Int(readLine() ?? "1")!)
        for car in cars {
            if car.body == body{
                print("\n Производитель:", car.manufacturer, "\n Модель:", car.model, "\n Год выпуска:", car.yearOfIssue ?? "-")
                if let carNumber = car.carNumber {
                    print(" Государственный номер:", carNumber)
                }
            }
        }
    default:
        x = 0
    }
} while(x != 0)
