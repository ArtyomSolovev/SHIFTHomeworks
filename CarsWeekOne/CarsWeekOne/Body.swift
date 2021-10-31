//
//  Body.swift
//  CarsWeekOne
//
//  Created by Артем Соловьев on 29.10.2021.
//

import Foundation

enum Body: String, CaseIterable {
    case Unknown = "Некатегорированный"
    case Sedan = "Седан"
    case SUV = "Кроссовер"
    case Coupe = "Купе"
    case Van = "Фургон"
    case Hatchback = "Хэтчбек"
    case Pickup = "Пикап"
    
    func getTypeOfBody(number:Int) -> Body{
        switch number {
        case 1:
            return .Sedan
        case 2:
            return .SUV
        case 3:
            return .Coupe
        case 4:
            return .Van
        case 5:
            return .Hatchback
        case 6:
            return .Pickup
        default:
            return .Unknown
        }
    }
}
