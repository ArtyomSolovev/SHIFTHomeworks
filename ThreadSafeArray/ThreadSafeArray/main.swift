//
//  main.swift
//  ThreadSafeArray
//
//  Created by Артем Соловьев on 05.11.2021.
//

import Foundation

var safeArray = ThreadSafeArray([])

let thread = DispatchQueue(label: "No", attributes: .concurrent)

thread.async {
    for number in 0...1000{
        safeArray.append(number)
    }
}
thread.async {
    for number in 0...1000{
        safeArray.append(number)
    }
}
sleep(1)
print("Result:",safeArray.count)
