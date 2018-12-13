//
//  Init.swift
//  Swift Intializers
//
//  Created by Mahesh Gahlot on 10/22/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import Foundation
class Food{
    let name: String
    init(name:String) {
        print("FOOD")
        self.name = name
        
    }
    convenience init(){
        self.init(name:"[UNNAMED]")
    }
}

class Market:Food {
    var quantity:Int
    init(nam:String, quantity:Int){
        self.quantity = quantity
        super.init(name: nam)
        print("Market")
    }
    convenience override init(name:String){
        self.init(nam: name, quantity: 1)
    }
    // init(name:) is the only designated initializer of Food class so According to Rule 2 of Automatic intializer Inheritence all the Convenience Intializer of Food class are inherited in Market class.
}
class Base {
    let value: Int
    init(value:Int) {
        self.value = value
    }
}
class Derived:Base {
    let name = "Derived"
    
}
