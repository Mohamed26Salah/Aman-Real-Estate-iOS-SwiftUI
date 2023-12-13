//
//  Country.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 12/12/2023.
//

import Foundation

struct Country: Codable, Equatable, Hashable {
    let nameAr: String
    let name: String
    let id: Int
    let code: String
    let image: String
    let dialCode: String

    enum CodingKeys: String, CodingKey {
        case nameAr = "name_ar"
        case name
        case id
        case code
        case image
        case dialCode = "dial_code"
    }
}
typealias Countries = [Country]
