//      For-In Loop

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)")
}


let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}


for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}


//f you don’t need each value from a sequence, you can ignore the values by using an underscore in place of a
//variable name.
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

//let minutes = 60
//for tickMark in 0..<minutes {
//    // render the tick mark each minute (60 times)
//
//}
//
//
//
//let minuteInterval = 5
//for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
//    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
//}
//
//
//let hours = 12
//let hourInterval = 3
//for tickMark in stride(from: 3, through: hours, by: hourInterval) {
//    // render the tick mark every 3 hours (3, 6, 9, 12)
//}


//repeat-while loop (similar to do while)
var x=0
repeat{
    print("repeat While loop")
    
}while x != 0


//switch

let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

/*
 
 The body of each case must contain at least one executable statement. It is not valid to write the following
 code, because the first case is empty:

 */
//let anotherCharacter: Character = "a"
//switch anotherCharacter {
//case "a": // Invalid, the case has an empty body
//case "A":
//    print("The letter A")
//default:
//    print("Not the letter A")
//}
// This will report a compile-time error.


let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}
// Prints "The letter A"


//  INTERVAL MATCHING
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
// Prints "There are dozens of moons orbiting Saturn."


// Where Clause
//A switch case can use a where clause to check for additional conditions.
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}


//COMPOUND CASES

let somCharacter: Character = "e"
switch somCharacter {
case "a", "e", "i", "o", "u":
    print("\(somCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(somCharacter) is a consonant")
default:
    print("\(somCharacter) is not a vowel or a consonant")
}
/*
            Value Bindings
 
 A switch case can name the value or values it matches to temporary constants or variables, for use in the
 body of the case. This behavior is known as value binding, because the values are bound to temporary
 constants or variables within the case’s body.

 */

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
