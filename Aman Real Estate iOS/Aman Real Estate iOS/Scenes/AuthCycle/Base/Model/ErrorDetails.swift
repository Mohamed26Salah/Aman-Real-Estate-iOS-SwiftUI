//
//  ErrorDetails.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 18/12/2023.
//

import Foundation

struct ErrorDetails: Identifiable {
    let name: String
    let error: String
    let id = UUID()
}
