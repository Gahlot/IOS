//
//  DiagnosisBody.swift
//  MedicalAssistant
//
//  Created by Mahesh Gahlot on 2/2/19.
//  Copyright © 2019 finoit. All rights reserved.
//

import Foundation

import Foundation

struct DiagnosisBody: Codable {
    var sex: String
    var age: Int
    var evidence: [Evidence]
    
    mutating func addEvidence(id: String, choiceID: String, initial: Bool ){
        evidence.append(Evidence(id: id, choiceID: choiceID, initial: initial))
    }
}

struct Evidence: Codable {
    let id, choiceID: String
    let initial: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case choiceID = "choice_id"
        case initial
    }
    
    
}

extension DiagnosisBody {
    
    init(sex: String, age: Int) {
        self.init(sex: sex, age: age, evidence: [Evidence]())
     
    }
}

extension Evidence {
    init(id: String, choiceID: String){
        self.init(id: id, choiceID: choiceID, initial: false)
    }
}
