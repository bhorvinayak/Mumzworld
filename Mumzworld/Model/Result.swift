//
//  ShoppingOffers.swift
//  Mumzworld
//
//  Created by Vinayak Bhor on 24/11/19.
//  Copyright © 2019 Vinayak Bhor. All rights reserved.
//
import Foundation
struct Result : Codable {
	let offers : [Off]?

	enum CodingKeys: String, CodingKey {

		case offers = "offers"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		offers = try values.decodeIfPresent([Off].self, forKey: .offers)
	}

}
