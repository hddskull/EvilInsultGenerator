//
//  Insult.swift
//  EvilInsultGenerator
//
//  Created by Max Gladkov on 19.07.2021.
//

import Foundation
import Alamofire

struct Insult {    
    static func fetchInsult() {
        
        
        
        let request = AF.request("https://evilinsult.com/generate_insult.php?lang=en&type=json")
        request.responseJSON { response in
            guard let statusCode = response.response?.statusCode else { return }
            if (200..<300).contains(statusCode) {
                print( "StatusCode:", statusCode, "\n", response.result)
            } else {
                print("unsuccessful")
            }
            
            guard let value = response.value else { return }
            let dict = value as! NSDictionary
            let insult = dict.object(forKey: "insult")
            let userInfo: [String: Any] = ["Insult": insult!]
            NotificationCenter.default.post(name: .didRecieveInsult, object: nil, userInfo: userInfo)
        }
    }
    

}
