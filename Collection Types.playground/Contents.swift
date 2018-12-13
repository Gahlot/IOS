//                  Arrays

var array: Array<Int>
var arr = [Int]()
// Both are Syntax for declaring an Array

arr.append(3)
print("array size = \(arr.count)")

arr=[]
print("array size = \(arr.count)")


//create array with default value

var an_arr = Array(repeating:0, count:3)
print(an_arr)


//create Array by adding two another Array
arr = [1,2,3]
var tarr = an_arr + arr
print(tarr)

//create Array with Array Literals

var shop = ["milk","cake"]
print(shop)

//Boolean 'isEmpty' property is a shotcut for checking wheather 'count' property is equal to 0.

if shop.isEmpty{
    print("Notting to buy")
} else {
    print("Shop Shop Shop!!!!")
}

shop.append("Flour") //add anew item at the end of Array.

//alternative of append

shop += ["Baking Powder","chocolate"]
print(shop)


var firstItem = shop[0]

shop[0] = "Eggs"  //replace value at index 0

shop[1...2] = ["Butter","Cheese"]
print(shop)


//Insert At specific position

shop.insert("cold Drinks",at: 3)
print(shop)
let egg = shop.remove(at: 0)
print(shop)


//  Iterate over Array
for list in shop{
print(list, terminator: " ")
}
print()

// Iterate Over Array with index and value

for (index, value) in shop.enumerated(){
    print("Item \(index + 1): \(value)")
}


//             SETS
/*

 A type must be hashable in order to be stored in a set—that is, the type must provide a way to
 compute a hash value for itself. A hash value is an Int value that is the same for all objects that compare
 equally, such that if a == b, it follows that a.hashValue == b.hashValue.
 
 */

//Syntax
print("******SETS*******")
var letters = Set<Character>()
print("Items = \(letters.count)")

letters.insert("a")             //insert item
print(letters)

letters = []        //make set again empty


// create set with Array Literals
var fav: Set<String> = ["linux","windows","mac"]
print(fav)

/*
 
 like Array, Sets also have property like 'count' and 'isEmpty'.
 
 */

print("size = \(fav)")
print("IS Empty = \(fav.isEmpty)")

fav.insert("Unix")

// remove() method either return remove value or 'nil' if value is not in set.

if let removeEle = fav.remove("Unix"){
    print(removeEle)
} else {
    print("Item not Present")
}

//check item is present or not using contains(_:) method
print(fav.contains("windows"))


// Iterate Over Set

for a in fav{
    print(a,terminator:" ")
    
}
print()
var set1 = Set<Int>()
set1 = [5,2,3]

//Iterate Over set in specific order(Increasing)
for s in set1.sorted(){
    print(s, terminator:" ")
    
}
var set2 = Set<Int>()
set2 = [1,2,4]
var uni = set1.union(set2)
var intersect = set1.intersection(set2)
var sub = set1.subtracting(set2) //sub = set1 - set2
var symmetry_sub = set1.symmetricDifference(set2)  // set1 and set2 only not (set1 intersect set2)



// Set Membership and Equality
set1.isSubset(of: set2)
set1.isSuperset(of: set2)
set1.isDisjoint(with: set2)


//Dictionaries

print("********Dictionaries*********")

/*
 
 
 A dictionary Key type must conform to the Hashable protocol, like a set’s value type.
 
 dictionary also have 'count' and 'isEmpty' property.
 
 
 */

var dict = [Int: String]()
dict[10] = "Mahesh"
print("Size = \(dict.count)")
print("Is Empty = \(dict.isEmpty)")


dict = [:]  ///make dict empty again


// Create Dictionary with Dictionary Literal

//var os: [String: String] = ["mac":"mahesh","fedora":"vibhor"]
// or
var os: [String: String]
os = ["mac":"mahesh","fedora":"vibhor"]

print(os)

//change value of particular Key

os["fedora"] = "Sebin"    //subscript sytax to change value associated with a key. if key not present then
            //insert this key and value

// or you can use updateValue(_:forKey) method
/*
 
 Unlike a subscript, however, the updateValue(_:forKey:) method returns the old value after performing an
 update. This enables you to check whether or not an update took place.The updateValue(_:forKey:) method
 returns an optional value of the dictionary’s value type. For a dictionary that stores String values,
 for example, the method returns a value of type String?, or “optional String”. This optional value
 contains the old value for that key if one existed before the update, or nil if no value existed:
 
 */
if let oldValue = os.updateValue("pawan", forKey: "mac"){
    print(oldValue)
} else {
    print("new entry is added in dictionary os")
}

/*
 
 You can also use subscript syntax to retrieve a value from the dictionary for a particular key. Because it
 is possible to request a key for which no value exists, a dictionary’s subscript returns an optional
 value of the dictionary’s value type. If the dictionary contains a value for the requested key, the
 subscript returns an optional value containing the existing value for that key. Otherwise, the subscript
 returns nil:
 
 */
if let mac = os["mac"]{
    print(mac)
} else{
    print("Key not exist")
}
//use subscript method to remove a key value pair

os["mac"] = nil
print(os)

//remove using removeValue(forKey:) method
if let mac = os.removeValue(forKey: "mac"){
    print(mac)
} else{
    print("Key not exist")
}

//Iterate Over a Dictionary
for (k,v) in os{
    print("key=\(k) Value=\(v)")
    
}


let Keys = [String](os.keys)            //array of Keys
let Values = [String](os.values)             // array of values

