//
//  Diagnosis.swift
//  MedicalAssistant
//
//  Created by Mahesh Gahlot on 2/2/19.
//  Copyright © 2019 finoit. All rights reserved.
//
struct Diagnosis: Codable {
    let question: Question
    let conditions: [DiagnosisCondition]
    let extras: Extras
    let shouldStop: Bool
    
    enum CodingKeys: String, CodingKey {
        case question, conditions, extras
        case shouldStop = "should_stop"
    }
}

struct DiagnosisCondition: Codable {
    let id, name, commonName: String
    let probability: Double
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case commonName = "common_name"
        case probability
    }
}




