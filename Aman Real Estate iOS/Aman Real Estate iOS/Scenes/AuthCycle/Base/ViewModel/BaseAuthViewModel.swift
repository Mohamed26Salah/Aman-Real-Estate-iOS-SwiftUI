//
//  BaseViewModel.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 12/12/2023.
//

import SwiftUI

class BaseAuthViewModel: ObservableObject {
    @Published var showAlert: Bool = false
    @Published var error: ErrorDetails?
    @Published var showLoading: Bool = false
    @Published var isLoading: Bool = true
}

//MARK: - Common Local Calls -
extension BaseAuthViewModel {

}

