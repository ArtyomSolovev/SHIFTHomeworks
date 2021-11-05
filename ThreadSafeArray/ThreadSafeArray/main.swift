//
//  main.swift
//  ThreadSafeArray
//
//  Created by Артем Соловьев on 05.11.2021.
//

import Foundation

struct ThreadSafeArray<T> {
    
    private var array = Array<T>()
    private let queue = DispatchQueue(label: "SafeQueue", qos: .default, attributes: .concurrent)
    let semaphore = DispatchSemaphore(value: 1)
    
    init(_ addingArray: [T]){
        array = addingArray
    }
    
    var isEmpty: Bool {
        get{
            queue.sync {
                array.count == 0
            }
        }
    }
    var count: Int{
        queue.sync {
            array.count
        }
    }
    
    mutating func append(_ item: T){
        queue.sync {
            semaphore.wait()
            array.append(item)
            semaphore.signal()
        }
    }
    mutating func remove(at index: Int) {
        queue.sync {
            semaphore.wait()
            array.remove(at: index)
            semaphore.signal()
        }
    }
    
    subscript (index: Int) -> T{
        get{
            queue.sync {
                array[index]
            }
        }
    }
    func contains(_ element: T) -> Bool where T:Equatable {
        return array.contains{ $0 == element}
    }
    
}

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
