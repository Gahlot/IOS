//
//  main.swift
//  Swift Enumerations
//
//  Created by Mahesh Gahlot on 10/18/18.
//  Copyright © 2018 finoit. All rights reserved.
//

enum Compass{
    case north
    case south
    case east
    case west
}
// or
// enum Compass{
// case nourth, south, east, west
//}
var direction = Compass.north

direction = .east  //The type of 'direction' is already known, and so we can drop the type when setting its value.

//
//switch direction {
//case .north:
//    print("Go north")
//case .south:
//    print("Go South")
//}
//  switch statement must be exhaustive when considering an enumeration’s cases. If any of the cases  is omitted,
//the code does not compile, either put all cases or put default case


//exhaustive Switch
switch direction {
case .north:
    print("Go north")
case .south:
    print("Go South")
case .east:
    print("Go East")
case .west:
    print("Go west")
}


// or use defaut statement
switch direction {
case .north:
    print("Go north")
case .south:
    print("Go South")
default:
    print("NOt GoGo ")
}


//    Iterating Over Enumeration cases
// for this it's useful to have a collection of all that(which we nedd to iterate) enumuration cases
//we enable this by writing': CaseIterable' after the enumeration's name
//Swift exposes a collection of all the cases as an 'allCases' property of the enumeration type.

//NOTE  --->>>>>>  CaseIterable and allcases property are introduded in Swift 4.2 so they not work in previous versions
//          of swift like 4.0 . My Swift verson is 4.0 so not work
//enum Beverage: CaseIterable {
//    case coffee, tea, juice
//}
//let noOfChoices = Beverage.allCases.count
//print("total No. of Choices = \(noOfChoices)")
//
//for bev in Beverage.allCases {
//    print(bev)
//}

// Associate Values

enum Barcode{
    case upc(Int,Int,Int,Int)
    case qrCode(String)
}
var productBarcode = Barcode.upc(1, 23456, 98765, 3)
productBarcode = .qrCode("ABCEDFDKGKJGHUBGKJGLGJFG")


//Raw Values
enum ConrolChar: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
var tab = ConrolChar.tab.rawValue
print("\(tab) HOOO!")


            // Implicitly Assigned Raw Values

/*
 
 When we working with enumerations that store 'integer or string raw values', we don’t have to explicitly assign a
 raw value for each case. Swift automatically assign the values for us.
 
 when integers are used for raw values, the implicit value for each case is one more than the previous case.
 
 If the first case doesn’t have a value set, its value is 0.
 
 When strings are used for raw values, the implicit value for each case is the text of that case’s name.
 
 */

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
var position = Planet.earth.rawValue
print("position of earth is \(position)")

enum Day: String{
    case Monday, Tuesday, Wednesday, Thusday, Friday, Saturday, Sunday
}

let today = Day.Thusday.rawValue
print("Today is \(today)")



                        // Initializing with a Raw Value

/*
 
 If you define an enumeration with a raw-value type, the enumeration automatically receives an initializer that takes a
 value of the raw value’s type (as a parameter called rawValue) and returns either an enumeration case or nil.

 */

let pos = 11
if let somePlanet = Planet(rawValue: pos) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(pos)")
}


                        // Recursive Enumerations

/*
 
 A recursive enumeration is an enumeration that has another instance of the enumeration as the associated value
 for one or more of the enumeration cases.
 
 we indicate that an enumeration case is recursive by writing indirect before it, which tells the compiler to insert the necessary layer of indirection.

 we can also write indirect before the beginning of the enumeration to enable indirection for all of the enumeration’s cases that have an associated value.
 */

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

// or

indirect enum ArithmeticExp {
    case number(Int)
    case addition(ArithmeticExp, ArithmeticExp)
    case multiplication(ArithmeticExp, ArithmeticExp)
}

// code to compute '(5 + 4) * 2'

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print("(5 + 4) * 2 = \(evaluate(product))")
