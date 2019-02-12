//
//  Condition.swift
//  MedicalAssistant
//
//  Created by Mahesh Gahlot on 2/2/19.
//  Copyright © 2019 finoit. All rights reserved.
//

import Foundation

struct Condition: Codable {
    let id, name, commonName, sexFilter: String
    let categories: [String]
    let prevalence, acuteness, severity: String
    let extras: Extras
    let triageLevel: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case commonName = "common_name"
        case sexFilter = "sex_filter"
        case categories, prevalence, acuteness, severity, extras
        case triageLevel = "triage_level"
    }
}


