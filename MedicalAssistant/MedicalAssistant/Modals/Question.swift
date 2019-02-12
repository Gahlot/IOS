//
//  Question.swift
//  MedicalAssistant
//
//  Created by Mahesh Gahlot on 2/2/19.
//  Copyright © 2019 finoit. All rights reserved.
//

import Foundation

struct Question: Codable {
    let type, text: String
    let items: [Item]
    let extras: Extras?
}

struct Item: Codable {
    let id, name: String
    let choices: [Choice]
}

struct Choice: Codable {
    let id, label: String
}
