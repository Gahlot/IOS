//
//  Symptom.swift
//  MedicalAssistant
//
//  Created by Mahesh Gahlot on 2/2/19.
//  Copyright © 2019 finoit. All rights reserved.
//

import Foundation

struct Symptom: Codable {
    let id, name, commonName, question: String
    let sexFilter, category, seriousness: String
    let extras: Extras?
    let children: [Child]
    let imageURL, imageSource, parentID, parentRelation: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case commonName = "common_name"
        case question
        case sexFilter = "sex_filter"
        case category, seriousness, extras, children
        case imageURL = "image_url"
        case imageSource = "image_source"
        case parentID = "parent_id"
        case parentRelation = "parent_relation"
    }
}

struct Child: Codable {
    let id, parentRelation: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case parentRelation = "parent_relation"
    }
}
