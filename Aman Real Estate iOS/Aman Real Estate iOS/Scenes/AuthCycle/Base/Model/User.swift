//
//  User.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 18/12/2023.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullName: String
    let email: String
    let phoneNumber: String
    let role: Role
}
extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullName: "Mock Name", email: "Mock@gmail.com", phoneNumber: "01097262974", role: .user)
}

enum Role: String, Codable {
    case admin = "admin"
    case moderator = "moderator"
    case user = "user"
}

