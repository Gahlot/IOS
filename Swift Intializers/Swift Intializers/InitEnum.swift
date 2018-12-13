//
//  InitEnum.swift
//  Swift Intializers
//
//  Created by Mahesh Gahlot on 10/22/18.
//  Copyright © 2018 finoit. All rights reserved.
//

import Foundation
enum Tempetature{
    case Kelvin, Celsius, fahrenheit
    init?(CharValue:Character){                      //Fallable Initializer: Enumurations have this fallable Intialize by Default with parameter name 'rawValue'
        switch CharValue {
        case "k":
            self = .Kelvin
        case "c":
            self = .Celsius
        case "f":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

