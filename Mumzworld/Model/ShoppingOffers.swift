//
//  ShoppingOffers.swift
//  Mumzworld
//
//  Created by Vinayak Bhor on 24/11/19.
//  Copyright © 2019 Vinayak Bhor. All rights reserved.
//

import Foundation
struct ShoppingOffers : Codable {
    let result : Result?
    
    enum CodingKeys: String, CodingKey {
        
        case result = "result"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent(Result.self, forKey: .result)
    }
    
}
