//
//  main.swift
//  ThreadSafeArray
//
//  Created by Артем Соловьев on 05.11.2021.
//

import Foundation

var safeArray = ThreadSafeArray<Int>()

let queue = DispatchQueue(label: "No", attributes: .concurrent)
let group = DispatchGroup()

for number in 0...1000{
    group.enter()
    queue.async {
        safeArray.append(number)
        group.leave()
    }
}
for number in 0...1000{
    group.enter()
    queue.async {
        safeArray.append(number)
        group.leave()
    }
}
group.wait()
print("Result:",safeArray.count)
