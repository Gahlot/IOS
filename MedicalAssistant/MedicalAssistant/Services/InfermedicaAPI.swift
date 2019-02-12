//
//  InfermedicaAPI.swift
//  MedicalAssistant
//
//  Created by Mahesh Gahlot on 2/2/19.
//  Copyright © 2019 finoit. All rights reserved.
//
import Alamofire
import Foundation
class InfermedicaAPI {
    static private let app_id = "ef05b1f4"
    static private let app_key = "55aaccb2fd26553c2550e591ac6db1fc"
    var initial = true
    static private let headers = ["App-Id":InfermedicaAPI.app_id, "App-Key":InfermedicaAPI.app_key]
    var diagnosis_Body: DiagnosisBody!
    var diagnosis: Diagnosis?
    static private var count = 1
    private var interview_id: String?
    static private var request: InfermedicaAPI!
    static func initial_Diagnosys(sex: String, age: Int) -> InfermedicaAPI {
        request = InfermedicaAPI()
        request.diagnosis_Body = DiagnosisBody(sex: sex, age: age)
        InfermedicaAPI.count = count + 1
        request.interview_id = "12\(sex)\(age)gioj9ghfr\(InfermedicaAPI.count)"
        return request
    }
    
    func add_Symptoms(id: String, choiceId: String){
        
        self.diagnosis_Body.addEvidence(id: id, choiceID: choiceId, initial: self.initial)
        if(initial == true){
            initial = false
        }
        
    }
    
    func diagnos(completion: @escaping () -> Void) {
        if diagnosis_Body.evidence.count == 0 {
            print("no intial Symptom selected")
            
        } else {
            let jsonEncoder = JSONEncoder()
            let jsonData = try! jsonEncoder.encode(self.diagnosis_Body)
            let data = try! JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as! [String:Any]
            let semaphore = DispatchSemaphore(value: 1)
            semaphore.wait()
            Alamofire.request("https://api.infermedica.com/v2/diagnosis", method: HTTPMethod.post, parameters: data, encoding: JSONEncoding.default, headers: InfermedicaAPI.headers).responseData(completionHandler: { [unowned self] response in
                switch(response.result) {
                    case .success(let data):
                        self.diagnosis = try! JSONDecoder().decode(Diagnosis.self, from: data)
                        completion()
                    case .failure(let error):
                        print(error.localizedDescription)
                }
                semaphore.signal()
            })
            
        }
    }
    
    func question() -> Question? {
        return diagnosis?.question
    }
    
    func shouldStop() -> Bool {
        return diagnosis!.shouldStop
    }
    
    func search(_ phrase: String, completion: @escaping (Search) -> Void)  {
        var searchResults: Search?
        
        Alamofire.request("https://api.infermedica.com/v2/search", method: .get, parameters: ["phrase":phrase], headers: InfermedicaAPI.headers).responseData { (response) in
            switch response.result {
                case .success(let data):
                    searchResults = try! JSONDecoder().decode(Search.self, from: data)
                
                case .failure(let error):
                    print(error.localizedDescription)
            }
            completion(searchResults ?? Search())
        }
        
    }
    
    func conditions() -> [DiagnosisCondition]? {
        return diagnosis?.conditions
    }
}




