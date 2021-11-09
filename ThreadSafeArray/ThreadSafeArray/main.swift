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

group.enter()
queue.async{
    for number in 0...1000 {
        safeArray.append(number)
    }
    group.leave()
}
group.enter()
queue.async {
    for number in 0...1000 {
        safeArray.append(number)
    }
    group.leave()
}
group.wait()
print("Result:",safeArray.count)
