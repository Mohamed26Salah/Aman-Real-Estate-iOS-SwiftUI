//
//  CountryCodesViewModel.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 12/12/2023.
//

import SwiftUI
import Combine

class CountryCodesViewModel: ObservableObject {
    @Published var countryCodes: [Country] = []
    @Published var query: String = ""
    
    var countriesData: [Country] = []
    private var cancellables: Set<AnyCancellable> = []

    init() {
        getCountryCodes()
        searchCountryCodesData()
    }
}

//MARK: - GetCountryCodes -
extension CountryCodesViewModel {
    func getCountryCodes() {
        guard let url = Bundle.main.url(forResource: "CountryCodes", withExtension: "json") else {
            print("Coudnt Find Json File")
            return
        }
        do{
            let jsonData = try Data(contentsOf: url)
            let decodedJson = try JSONDecoder().decode(Countries.self, from: jsonData)
            countriesData = decodedJson
            countryCodes = decodedJson
        } catch {
            print("Error loading or parsing the JSON file: \(error)")
        }
    }
}
//MARK: - Search -
extension CountryCodesViewModel {
    func searchCountryCodesData() {
        $query
            .debounce(for: 0.5, scheduler: DispatchQueue.main) // Add debounce to avoid rapid updates
            .removeDuplicates()
            .sink { [weak self] newQuery in
                guard let self = self else {return}
                withAnimation {
                    if newQuery.isEmpty {
                        self.countryCodes = self.countriesData
                    } else {
                        self.countryCodes = self.countriesData.filter { country in
                            return country.name.lowercased().contains(newQuery.lowercased())
                        }
                    }
                }
            }
            .store(in: &cancellables)
    }
}
