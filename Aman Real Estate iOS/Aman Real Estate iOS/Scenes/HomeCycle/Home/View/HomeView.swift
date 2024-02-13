//
//  HomeView.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 13/02/2024.
//

import SwiftUI

struct HomeView: View {
    let layout = [GridItem(.fixed(180)),GridItem(.fixed(180))]
    @State var searchText: String = ""
    var body: some View {
        ScrollView{
            VStack(spacing: 30) {
                locationAndNotifcationView
                SearchBar(placeHolder: "Search Real Estate", searchText: $searchText)
                    .padding()
                horizontalCells
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(0..<4) { index in
                            ZStack {
                                Capsule()
                                    .stroke(Color.neutrals500)
                                    .frame(width: 90, height: 50)
                                Text("Home")
                                    .applyLabelStyle(style: .BodyMediumBold)
                            }
                        }
                    }
                }
                .padding()
                
                LazyVGrid(columns: layout) {
                    ForEach(0..<30) { index in
                        if index % 2 == 0 {
                            VerticalCell()
                                .padding(.horizontal, 5)
                        } else {
                            VerticalCell()
                                .padding(.horizontal, 5)
                                .padding(.top, 50)
                        }
                    }
                }
                
            }
        }
    }
    
    @ViewBuilder
    var locationAndNotifcationView: some View {
        HStack {
            VStack(alignment:.leading){
                Button(action: {print("LocationButtonTapped")}, label: {
                    HStack(spacing: 2){
                        Text("Location")
                            .applyLabelStyle(style: .BodyMediumMedium, color: .neutrals500)
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.neutrals500)
                            .frame(width: 15, height: 15)
                    }
                })
                HStack{
                    Image(systemName: "location.fill")
                        .foregroundStyle(.blue500)
                        .frame(width: 15, height: 15)
                    Text("Cairo, Egypt")
                        .applyLabelStyle(style: .Heading6)
                }
            }
            Spacer()
            ZStack {
                Circle()
                    .stroke(lineWidth: 0.7)
                    .foregroundStyle(.neutrals500)
                    .frame(width: 40, height: 40)
                Image("bell")
                    .resizable()
                    .interpolation(.none)
                    .frame(width: 25, height: 25)
                Circle()
                    .foregroundStyle(.red)
                    .frame(width: 10, height: 10)
                    .offset(x: 8.0, y: -5.0)
            }
        }
        .padding()
        .frame(height: 41)
    }
    @ViewBuilder
    var horizontalCells: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(0..<10) { index in
                    HorizontalCell()
                        .frame(width: 300)
                }
            }
        }
        .scrollIndicators(.hidden)
        .frame(height: 120)
    }
}

#Preview {
    HomeView()
}
