//
//  main.swift
//  Swift Intializers
//
//  Created by Mahesh Gahlot on 10/22/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import Foundation

print("Hello, World!")

var take = Market()
print("\(take.name) and \(take.quantity)")


if let s = Tempetature(CharValue:"c")
{
    print("The value of s is \(s)")
}else{
    print("It is Nil")
}
//
//var example = Derived()
//print(example.value)

