//
//  main.swift
//  swiftFunctions
//
//  Created by Mahesh Gahlot on 10/17/18.
//  Copyright © 2018 finoit. All rights reserved.
//

func sayHello() -> String {
    return "Hello"
}

func add(a: Int,b: Int) -> Int {
    return a+b
}


func greet(person: String) {
    print("Hello \(person)")
}

//func minMax(arrary: [Int] ) -> (min:Int, max:Int) {
//    var min = arrary[0]
//    var max = arrary[0]
//
//    for v in arrary{
//        if v < min{
//            min = v
//        }
//        if v > max{
//            max = v
//        }
//    }
//    return (min, max)
//}
//
//let a = minMax(arrary: [2,3,4,5,6,7,8])
//
//print(a)

// Optional Tuple type
func minMax(arrary: [Int] ) -> (min:Int, max:Int)? {
    if arrary.isEmpty { return nil}
    var min = arrary[0]
    var max = arrary[0]
    
    for v in arrary{
        if v < min{
            min = v
        }
        if v > max{
            max = v
        }
    }
    return (min, max)
}

if let a = minMax(arrary: [2,3,4,5,6,7,8]){

print(a)
} else {
    print("Array is Empty")
}

/*
 
Every Function has a 'argument label' and 'parameter label'.
 
The argument label is used when calling the function; each argument is written in the function call
 with its argument label before it.
 
 By default, parameters use their parameter name as their argument label.
*/
func adder(arg1 a:Int, arg2 b:Int){
    print(a+b)
}
adder(arg1: 2, arg2: 2)
 //  Omitting Argument Label
func multiplier(_ a:Int, arg2 b:Int){
    print(a*b)
}
multiplier(2, arg2: 2)


func divide(_ a:Int, _ b:Int){
    print(a/b)
}
divide(2, 2)


//Varioadic parameters

func display(_ num: Int...){
    print(num)
    for i in num{
        print(i,terminator: " ")
    }
    print()
}
display(1,2,3,4,5,6,7,8,9)

// in-out parameters (cannot have default values and variadic parameters cannot be marked as inout)

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var x = 10
var y = 20
print("Before swap x = \(x) and y = \(y) ")
swapTwoInts(&x, &y)
print("After swap x = \(x) and y = \(y) ")

//Function Types

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}


var mathFunction: (Int, Int) -> Int = addTwoInts

print("Result in case 1: \(mathFunction(2,3))")

mathFunction = multiplyTwoInts

print("Result in case 2: \(mathFunction(2,3))")

// Function Type as parameter Types
func Result(_ mathFun:(Int, Int) -> Int, _ a: Int,_ b: Int ){
    print("In Result Func: \(mathFun(a,b))")
}

Result(addTwoInts, x, y)  // x=20  y=10

Result(multiplyTwoInts, x, y)

//simalary Function Type can be used as Return Type

//Nested Function
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)",terminator:" ")
    currentValue = moveNearerToZero(currentValue)
}
print()

