//
//  Constants.swift
//  VisitCard
//
//  Created by Артем Соловьев on 12.11.2021.
//

import Foundation

enum Conatants {
    enum aboutMe : String{
        case photo = "myPhoto"
        case briefInformation = "Соловеьв Артем, 22 года"
        case fullInformationStart = """
        Образование: Студент 5 курса
        Университет: ПГУПС
        Факультет: АИТ
        Специльность: Информационная безопаснсоть
        """
        case fullInformationEnd = """
        Родной город: Санкт-Петербург
        Город проживания: Санкт-Петербург
        
        """
    }
    enum skills : String{
        case welcome = "Выберете раздел, который вас интересует"
        case experience = """
        Изучаю swift пол года.
        Программирование начал изучать в университете 5 лет назад.
        """
        case language = """
        Языки с которыми хорошо знаком: Python, C++
        Языки, которые проходил: Java, Kotlin, SQL
        """
        case expectations = """
        Получить более глубокие знания.
        Начать заниматься Swift на профессиональном уровне
        """
    }
}
