print((1,"HeLLO") < (2,"World"))

print((3,"HeLLO") < (3,"World"))

print((3,"HeLLO") == (3,"World"))

print((1,"HeLLO") == (2,"HeLLo"))

(2, "HeLLO") == (2, "HeLLO")

print((1,"HeLLO") == (3,"World"))

var has = true

let ans = 2 + (has ? 20 : 40)

let a:Int? = nil
var b = 10
let c = a ?? b


for index in 1...10{
    print("5 * \(index) = \(index * 5)")
}


for index in 1..<10{
    print("5 * \(index) = \(index * 5)")
}

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count

for name in names[2...] {
    print(name, terminator:" ")
}
print()
for name in names[..<2] {
    print(name, terminator:" ")
}
print()
