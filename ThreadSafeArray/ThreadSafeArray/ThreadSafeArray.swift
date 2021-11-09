//
//  ThreadSafeArray.swift
//  ThreadSafeArray
//
//  Created by Артем Соловьев on 08.11.2021.
//

import Foundation

struct ThreadSafeArray<T> {
    
    private var array = Array<T>()
    private let semaphore = DispatchSemaphore(value: 1)
    
    init() {}
    
    init(_ addingArray: [T]) {
        array = addingArray
    }
    
    var isEmpty: Bool {
        semaphore.wait()
        let isEmpty = array.isEmpty
        semaphore.signal()
        return isEmpty
    }
    
    var count: Int {
        semaphore.wait()
        let count = array.count
        semaphore.signal()
        return count
    }
    
    mutating func append(_ item: T) {
        semaphore.wait()
        array.append(item)
        semaphore.signal()
    }
    
    mutating func remove(at index: Int) {
        semaphore.wait()
        if index < array.count {
            array.remove(at: index)
        }
        semaphore.signal()
    }
    
    subscript (index: Int) -> T {
        get {
            semaphore.wait()
            let number = array[index]
            semaphore.signal()
            return number
        }
        set {
            semaphore.wait()
            array[index] = newValue
            semaphore.signal()
        }
    }
    
    func contains(_ element: T) -> Bool where T:Equatable {
        semaphore.wait()
        let contains = array.contains{ $0 == element}
        semaphore.signal()
        return contains
    }
    
}
