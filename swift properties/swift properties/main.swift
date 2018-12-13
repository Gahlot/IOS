//
//  main.swift
//  swift properties
//
//  Created by Mahesh Gahlot on 10/18/18.
//  Copyright © 2018 finoit. All rights reserved.
//

//Stored Properties

struct Prop {
    var fValue: Int                     //stored properties
    let length: Int                      //stored ^
}

var examp = Prop(fValue: 2, length: 3)

print(examp)

examp.fValue = 10
 print(examp)

//Stored properties of constant structure Instances

let range = Prop(fValue: 1, length: 1)

//range is constant so we not able to change 'fValue' variable because Structure are value type

// Lazy Stored Properties

// lazy properties always declare as variable becoz value is set later.

// A lazy stored property is a property whose initial value is not calculated until the first time it is used.

class DataImport{
    var filename = "data.txt"
}

class DataManager{
    lazy var importer = DataImport()       // lazy variable is not initialize until its first call/used
    var data = [String]()
    
    
}
let manager = DataManager()
manager.data.append("some Data")
// the DataImport instance for the importer property has not yet been created

var file = manager.importer      //lazy var is inizialeze at this step with DataImport()
                                // Instance

//Subscripts
class Data{
    var sot = [String]()
    subscript(index: Int) -> String {
        get{
            return sot[index]
        }
        set{
            if(index > sot.count){
                sot.append(newValue)
            }
            else{
                sot.insert(newValue, at: index)
            }
        }
    }
}
 var dot = Data()
dot.sot.append("asd")
dot.sot.append("artgtsd")
var s = dot[1]
var sss = dot.sot[1]
print("\(s) = ==== \(sss)")

dot[2] = "Mahesh"

// Computed Properties

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

struct  Rect {
    var origin = Point()
    
    var size = Size()

var center : Point {
    get {
        let centerX  = origin.x + (size.width / 2)
        let centerY = origin.y + (size.height / 2)
        return Point(x: centerX, y: centerY)
    }
    set{
        origin.x = newValue.x - (size.width / 2)
        origin.y = newValue.y - (size.height / 2)
    }
}
}
var sqr = Rect(origin: Point() , size: Size(width: 10.0, height: 10.0))

let initialSqCenter  = sqr.center

print(initialSqCenter)

sqr.center = Point(x: 15.0, y: 15.0)

print("new origin is now at \(sqr.origin)")

/*
 
 You must declare computed properties—including read-only computed properties(which only have getter not setter)—as variable properties with the var keyword, because their value is not fixed.
 
 */


//Property Observers

//willSet :- called just before the value is stored  (the defalult parameter is newValue)
//didSet :- cassed immediately after the newValue is stored (the defalult parameter is newValue)

// during initialization both observers not called

class StepCount{
    var steps = 0{
        willSet{     //or willSet(newValue){
            print("The new value is \(newValue) and old value is \(steps)")
        }
        didSet{     //or didSet(oldValue){
            print("The new value is \(steps) and old value is \(oldValue)")
        }
    }
}
let stepCount = StepCount()
stepCount.steps = 200

// Type Properties

struct SomeStruct {
    static var storeTypeProperty = "Some Value"
}

enum SomeEnum{
    static var storeTypeProperty = "Some Value"
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storeTypeProperty = "Some Value"
    static var computedTypeProperty: Int {
        return 6
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}
print(SomeStruct.storeTypeProperty)
SomeEnum.computedTypeProperty
