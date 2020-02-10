//
//  ShoppingOffers.swift
//  Mumzworld
//
//  Created by Vinayak Bhor on 24/11/19.
//  Copyright © 2019 Vinayak Bhor. All rights reserved.
//

import Foundation
struct Off : Codable {
	let companyID : Int?
	let compnayLogo : String?
	let productDescription : String?
	let productEndDate  : Int?
	let productID : Int?
	let productName : String?
	let productStartDate : Int?
	let couponName : String?
	let wideImageURL : String?
	let companyLogo : String?
	let long_desc : String?

	enum CodingKeys: String, CodingKey {

		case companyID = "CompanyID"
		case compnayLogo = "CompnayLogo"
		case productDescription = "ProductDescription"
		case productEndDate  = "ProductEndDate "
		case productID = "ProductID"
		case productName = "ProductName"
		case productStartDate = "ProductStartDate"
		case couponName = "couponName"
		case wideImageURL = "wideImageURL"
		case companyLogo = "CompanyLogo"
		case long_desc = "long_desc"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		companyID = try values.decodeIfPresent(Int.self, forKey: .companyID)
		compnayLogo = try values.decodeIfPresent(String.self, forKey: .compnayLogo)
		productDescription = try values.decodeIfPresent(String.self, forKey: .productDescription)
		productEndDate  = try values.decodeIfPresent(Int.self, forKey: .productEndDate )
		productID = try values.decodeIfPresent(Int.self, forKey: .productID)
		productName = try values.decodeIfPresent(String.self, forKey: .productName)
		productStartDate = try values.decodeIfPresent(Int.self, forKey: .productStartDate)
		couponName = try values.decodeIfPresent(String.self, forKey: .couponName)
		wideImageURL = try values.decodeIfPresent(String.self, forKey: .wideImageURL)
		companyLogo = try values.decodeIfPresent(String.self, forKey: .companyLogo)
		long_desc = try values.decodeIfPresent(String.self, forKey: .long_desc)
	}

}
