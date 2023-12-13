//
//  BaseViewModel.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 12/12/2023.
//

import Foundation
class BaseAuthViewModel: ObservableObject {
    @Published var countryCodes: [Country] = []
    init() {
        getCountryCodes()
    }
}

//MARK: - Common Local Calls -
extension BaseAuthViewModel {
    func getCountryCodes() {
        guard let url = Bundle.main.url(forResource: "CountryCodes", withExtension: "json") else {
            print("Coudnt Find Json File")
            return
        }
        do{
            let jsonData = try Data(contentsOf: url)
            let decodedJson = try JSONDecoder().decode(Countries.self, from: jsonData)
            countryCodes = decodedJson
        } catch {
            print("Error loading or parsing the JSON file: \(error)")
        }
    }
}

