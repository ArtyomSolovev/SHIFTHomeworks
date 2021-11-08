//
//  ThreadSafeArray.swift
//  ThreadSafeArray
//
//  Created by Артем Соловьев on 08.11.2021.
//

import Foundation

struct ThreadSafeArray<T> {
    
    private var array = Array<T>()
    private let queue = DispatchQueue(label: "SafeQueue", qos: .default, attributes: .concurrent)
    private let semaphore = DispatchSemaphore(value: 1)
    
    init(_ addingArray: [T]){
        array = addingArray
    }
    
    var isEmpty: Bool {
        array.isEmpty
    }
    var count: Int{
        array.count
    }
    
    mutating func append(_ item: T){
        queue.sync {
            semaphore.wait()
            array.append(item)
            semaphore.signal()
        }
    }
    mutating func remove(at index: Int) {
        semaphore.wait()
        if index < array.count{
            queue.sync {
                array.remove(at: index)
                semaphore.signal()
            }
        }else{
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
