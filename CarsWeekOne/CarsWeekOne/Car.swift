//
//  Car.swift
//  CarsWeekOne
//
//  Created by Артем Соловьев on 29.10.2021.
//

import Foundation

struct Car: CustomStringConvertible {
    var description: String{
"""
    Производитель: \(self.manufacturer)
    Модель: \(self.model)
    Тип кузова: \(self.body.rawValue)
    Год выпуска: \(self.yearOfIssue == nil ? "-" : "\(self.yearOfIssue ?? 0)")
    \(self.carNumber == nil ? "" : "Государственный номер: \(self.carNumber ?? "")" )

"""
    }
    
    let manufacturer: String
    let model: String
    let body: Body
    let yearOfIssue: Int?
    let carNumber: String?
}
