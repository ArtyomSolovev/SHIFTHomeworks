//
//  main.swift
//  ThreadSafeArray
//
//  Created by Артем Соловьев on 05.11.2021.
//

import Foundation

var safeArray = ThreadSafeArray<Int>()

let queue = DispatchQueue(label: "SafeQueue", attributes: .concurrent)
let group = DispatchGroup()

queue.async {
    
    for number in 0...1000 {
        group.enter()
        safeArray.append(number)
        group.leave()
    }
}
queue.async {
    for number in 0...1000 {
        group.enter()
        safeArray.append(number)
        group.leave()
    }
}
group.wait()
sleep(1)
print("Result:",safeArray.count)
