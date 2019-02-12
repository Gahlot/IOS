//
//  Search.swift
//  MedicalAssistant
//
//  Created by Mahesh Gahlot on 2/2/19.
//  Copyright © 2019 finoit. All rights reserved.
//


import Foundation

typealias Search = [SearchElement]

struct SearchElement: Codable {
    let id, label: String
}
