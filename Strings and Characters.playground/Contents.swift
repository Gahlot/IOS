let someString = "Some string literal value"

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
print(wiseWords)


var emptyString = ""               // empty string literal
var anotherEmptyString = String()
// Above two strings are both empty, and are equivalent to each other

let quotation = """

The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop.
"""

// line breaks also included in Multiline String Literals

print(quotation)

print("Total number of character in quotation String \(quotation.count)") //count no. of characters in string

for character in "Dog!" {
    print(character, terminator:" ")
}
print()

var welcome = "Hello World"
let exclamation = "!"
welcome += exclamation
print(welcome)

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

// Inserting and Removing

var wlcome = "hello"
wlcome.insert("!", at:wlcome.endIndex)
wlcome.insert(contentsOf:" there", at:wlcome.index(before:wlcome.endIndex))
print(wlcome)

welcome.remove(at: welcome.index(before: welcome.endIndex))
print(welcome)

let range = wlcome.index(wlcome.endIndex, offsetBy: -6)..<wlcome.endIndex
wlcome.removeSubrange(range)
print(wlcome)

//Substrings

let greeting = "Hello, World!"
let index = greeting.endIndex
let Sub = greeting[..<index]




