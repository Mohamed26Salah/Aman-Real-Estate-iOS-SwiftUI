//
//  CountryCodesView.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 12/12/2023.
//

import SwiftUI

struct CountryCodesView: View {
    @ObservedObject var countryCodesViewModel = CountryCodesViewModel()
    @EnvironmentObject private var coordinator: AuthCoordinator
    
    @Binding var countryFlagCode: String
    @Binding var countryCode: String
    @Binding var selectedCountry: String
    var body: some View {
        VStack {
            Rectangle()
                .clipShape(.rect(cornerRadius: 50))
                .frame(width: 40, height: 6)
                .foregroundStyle(.neutrals200)
                .padding(.top, 16)
                .padding(.bottom, 24)
                
            HStack {
                Text("Select Country Code")
                    .applyLabelStyle(style: .BodyXLargeSemiBold, color: .neutrals900)
                    .padding(.horizontal, 16)
                Spacer()
                Button(action: {
                    coordinator.dismissSheet()
                }, label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .padding(.horizontal, 16)
                        .foregroundStyle(.neutrals900)
                })
                
            }
            SearchBar(searchText: $countryCodesViewModel.query)
                .padding(16)
            List(countryCodesViewModel.countryCodes, id: \.name) { country in
                HStack {
                    Image(country.image)
                        .resizable()
                        .frame(width: 27, height: 20)
                    Text(country.name)
                        .applyLabelStyle(style: .BodyMediumRegular, color: .neutrals900)
                        .lineLimit(2)
            
                    Spacer()
                    Text("+ " + country.dialCode)
                        .applyLabelStyle(style: .BodyMediumSemiBold, color: .neutrals900)
                }
                .listRowSeparator(.hidden)
                .onTapGesture {
                    countryFlagCode = country.code
                    countryCode = country.dialCode
                    selectedCountry = country.name
                    coordinator.dismissSheet()
                }
            }
            .listStyle(.plain)
        }
        
    }
}

//#Preview {
//    CountryCodesView()
//}

struct SearchBar: View {
    @Binding var searchText: String
    var body: some View {
        HStack {
            HStack(spacing: -10){
                Image(systemName: "magnifyingglass")
                    .frame(width: 15.63692, height: 16.01831)
                    .foregroundColor(.neutrals900)
                    .padding()
                TextField(text: $searchText) {
                    Text("Search country code")
                        .applyLabelStyle(style: .BodyMediumRegular, color: .neutrals600)
                }
                .frame(height: 50)

                Spacer()
                Button(action: {
                    searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 8)
                
            }
            .background(.neutrals50)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.neutrals300)
            )
        }
    }
}
