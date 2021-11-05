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
            array.append(item)
        }
    }
    mutating func remove(at index: Int) {
        queue.sync {
            array.remove(at: index)
        }
    }
    subscript (index: Int) -> T{
        get{
            queue.sync {
                array[index]
            }
        }
    }
//    array.contains(<#T##Self.Element#>)
//    func contains(_ element: T) -> Bool where T: Sequence{
//
//        var elements: Array<T>?
//
//        return array.contains{ $0 == element}
//        for index in array{
//            if index == element {
//                return true
//            }
//        }
//        return false
//
//    }
    
//    func isEmpty() -> Bool {
//        array.isEmpty
//    }
}

//extension ThreadSafeArray: Equatable{
//    static func == (lhs: ThreadSafeArray<T>, rhs: ThreadSafeArray<T>) -> Bool {
//        lhs == rhs
//    }
//}

var a = ThreadSafeArray([])

let aa = DispatchQueue(label: "No", attributes: .concurrent)

aa.async {
    for number in 0...100{
        print(number)
        a.append(number)
    }
}
aa.async {
    for number in 0...1000{
        a.append(number)
    }
}
print(a.count)
