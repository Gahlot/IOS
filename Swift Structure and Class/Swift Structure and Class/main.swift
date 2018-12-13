//
//  main.swift
//  Swift Structure and Class
//
//  Created by Mahesh Gahlot on 10/17/18.
//  Copyright © 2018 finoit. All rights reserved.
//

struct Resolution {
    var width = 0;
    var height = 0;
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// Instances

let someResol = Resolution()
let someVideoMode = VideoMode()

print("The width of some Resol ids \(someResol.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")

let vd = Resolution(width:20,height:10)

//All structures and enumerations are value types in Swift. (whenever copy creates a new buffer with same value )
//All classes are reference types in Swift.(whenever copy gives refrence not new buffer is created)

/*
 
 Collections defined by the standard library like arrays, dictionaries, and strings use an optimization to reduce the
 performance cost of copying. Instead of making a copy immediately, these collections share the memory where the
 elements are stored between the original instance and any copies. If one of the copies of the collection is
 modified, the elements are copied just before the modification. The behavior you see in your code is always as if a
 copy took place immediately.
 
 */


/*
 
 
 IDENTITY OPERATOR: Swift provide two types of Identity operator
 
 ->Identity to(===): check if value in both variable or constant point to same reference then it returns True Otherwise false
 
 ->Not identical to(!==): reverse of Identity To(===)
 
 */
