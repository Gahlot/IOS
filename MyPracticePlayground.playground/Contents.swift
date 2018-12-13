//: Playground - noun: a place where people can pla
//                                                                         Constant and variables
var str = "Hello, playground"

var strr2: String = "Type Annotations" //Type Annotations: To set which type values can accept by var or let
print(str)

var num = 10
let	s = str + String(num)
print(s)

var arr = [String]()                //Empty array which only stores strings
                        //it is mandatory to defined type of value Array stores
arr.append("hello")

var boolean: Bool = true;

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
print(regionalIndicatorForUS)

var x: Int = 2;
var y: Int = 3;
(x,y) = (y,x)                   //its actually Tuples Assignement

print(x,y)



//                                                  STRINGS AND CHARACTERS
let quotation = """

    The White Rabbit put on his spectacles.  "Where shall I begin,
    please your Majesty?" he asked.

    "Begin at the beginning," the King said gravely, "and go on
    till you come to the end; then stop.
"""

// line breaks also included in Multiline String Literals

print(quotation)

print("Total number of character in quotation String \(quotation.count)") //count no. of characters in string

let greet = "Good morning!"
greet[greet.startIndex]

greet[greet.index(after: greet.startIndex)]
//greet[greet.endIndex]                      //error out of string range access


//A multiline string can be indented to match the surrounding code.
//let quote = """
//
//The White Rabbit put on his spectacles.  "Where shall I begin,
//please your Majesty?" he asked.
//
//"Begin at the beginning," the King said gravely, "and go on
//till you come to the end; then stop.
//    """
// ********In above String 'Indentation error' is occured becz of last spaced multile quotes('  """ ')*****


/*
 
 
  Swift Strings are Value Type it means when String value is copied when it passed to function or
when it’s assigned to a constant or variable. In each case, a new copy of the existing String value is
 created, and the new copy is passed or assigned, not the original version.

 
 */
 
 
 
 
 
let arr1: Array<Int> = [Int]()

print(" take this \(num)")
let nick: String = "mahesh"
for a in nick{
    print(a)
}


//                                                              Nil-Coalescing Operator

/*
 
 The nil-coalescing operator (a ?? b) unwraps an optional a if it contains a value, or returns a default
 value b if a is nil. The expression a is always of an optional type.

 */

let nc: Int? = nil
var nc1 = nc ?? 4
print(nc1,"Nil-coalescing")

//The nil-coalescing operator is shorthand for the code below:
var nc2 = nc != nil ? nc! : 4


//                                                                Loops and Range Operators


for i in 0..<6{      //0..<6 :Half-open Range Operator -> shotcut for range(it means range 0 to less than 6)
                    //so i=0,1,2,3,4,5

    print(i,terminator:" ")     //terminator: " " : by default terminator is '\n'
}
print()


for i in 0...6{     //0...6 :Closed Range Operator -> shotcut for range(it means range 0 to 6(6 is incuded))
                    //so i=0,1,2,3,4,5,6

    print(i,terminator: " ")

}
print()


var arrr = [1,2,3,4,5]
for i in arrr[2...]{     //2... :One-sided Range -> arr[2] to arr[last index=4]
    //so i=0,1,2,3,4,5,6
    print(i,terminator: " ")
}
print()


for i in arrr[...2]{     //2... :One-sided Range -> arr[first index=0] to arr[2]
    //so i=0,1,2,3,4,5,6
    print(i,terminator: " ")
}
print()



for i in arrr[..<2]{     //2... :One-sided Range -> arr[first index] to arr[1]
    //so i=0,1,2,3,4,5,6
    print(i,terminator: " ")
}
print()



let rang = ...6
rang.contains(4)
rang.contains(7)
rang.contains(-9)



let osUser = [
    "Fedora":["Sebin","Deepak"],
    "Arch Linux":["Mahesh","Vibhor"],
    "Windows":["prince","Kushdeep"],
]
for (os,user) in osUser{
    print(os,"used by:",terminator:" ")
    for usr in user{
        print(usr,terminator: ", ")
    }
    print()
}



//                                                                                  Functions

func Factorial(n: Int) -> Int {
    if n<=1 {
        return 1;
    }
    return n * Factorial(n: n-1)
}
var n = Factorial(n: 5)
print(n)


func Fiboonicci(n : Int) -> Int {
    if(n==0||n==1||n==2){
        return n
    }
    let fib=Fiboonicci(n: n-1)+Fiboonicci(n: n-2)
       return fib
}



//                                                                                  Tuples

//let http404Error=(404,"not found")
//let (code,message) = http404Error
//let (code,_) = http404Error
let http400Error=(statusCode: 404,statusMessage: "not found")
print("The status code is \(http400Error.statusCode)")
print("The status code is \(http400Error.0)")
print("The status code is \(http400Error.1)")


//                                                                                  Optional

var fib = Fiboonicci(n: 5)
print(fib)
var opt: String? = nil;
opt = "a"
if opt != nil{   //only use force-unwrap when you are sure that optional must have a value
    //otherwise use optional binding for condition checking
    //if let a = opt {
    // Statements
    //}
    print("Hoo")
}


//                                                      Forced unwrap,optional binding and Implicit unwrap

//let a: Int? = 10
//print(a)
//print (a!)
let a: Int! = 10

/*
 
 Don’t use an implicitly unwrapped optional when there’s a possibility of a variable becoming nil at a later
 point. Always use a normal optional type if you need to check for a nil value during the lifetime of a
 variable.
 
 */

print (a)


//                                                                                 Error Handling

func divide(a: Int, b: Int) throws -> Double {
    let div = Double(a/b);
    return div
}
do{
    try
        _ = divide(a: 9, b: 2)
    
}
catch {}


//                                                                  Assertions and Preconditions

// Assertions are checked only in debug builds
//Preconditions are checked in both debug and productions builds
//let age = -3
//assert(age>=0,"age cannot be less than zero")
//If the code already checks the condition, you use the assertionFailure(_:file:line:) function to indicate
//that an assertion has failed.( preconditionFailure(_:file:line:) in case of Precondions) For example:

//if age > 10 {
//    print("You can ride the roller-coaster or the ferris wheel.")
//} else if age >= 0 {
//    print("You can ride the ferris wheel.")
//} else {
//    assertionFailure("A person's age can't be less than zero.")
//}
//precondition(index > 0, "Index must be greater than zero.")


