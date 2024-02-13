//
//  VerticalCell.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 13/02/2024.
//

import SwiftUI

struct VerticalCell: View {
    @State var width: CGFloat = .zero
    @State var height: CGFloat = .zero
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                .stroke(lineWidth: 0.3)
                .padding(.all, -5)
    
            VStack{
                ZStack{
                    Rectangle()
                        .overlay(content: {
                            Image(.secondHouseOnBoarding)
                                .resizable()
                                .scaledToFill()
                        })
                        .frame(width: width * 0.98, height: height * 0.98)
                        .cornerRadius(20, corners: .allCorners)
                    ZStack {
                        Circle()
                            .foregroundStyle(.white)
                        //                        .frame(width: 40, height: 40)
                        Image(.shieldDone)
                            .resizable()
                            .interpolation(.none)
                            .frame(width: 20, height: 20)
                    }
                    .frame(width: 30, height: 30)
                    .position(x: width * 0.11, y: height * 0.13)
                    
                    ZStack {
                        Circle()
                            .foregroundStyle(.white)
                        //                        .frame(width: 40, height: 40)
                        Image(systemName: "heart")
                            .resizable()
                            .interpolation(.none)
                            .frame(width: 15, height: 15)
                    }
                    .frame(width: 30, height: 30)
                    .position(x: width * 0.9, y: height * 0.99)
                    .shadow(radius: 4)
                }
                .getWidthAndHeight($width, $height)
                VStack(alignment: .leading, spacing: 13) {
                    HStack(spacing: 2) {
                        Image(systemName: "house.fill")
                            .foregroundStyle(.neutrals400)
                        Text("House").foregroundStyle(.neutrals500)
                    }
                    Text(394394, format: .currency(code: "USD"))
                        .applyLabelStyle(style: .BodyLargeSemiBold, color: .blue500)
                        .padding(.bottom, -5)
                    Text("NewCairo, First Settellment")
                        .applyLabelStyle(style: .BodyLargeSemiBold, color: .black)
                        .lineLimit(1)
                    HStack {
                        Image(systemName: "location.fill")
                            .foregroundStyle(.neutrals500)
                            .frame(width: 15, height: 15)
                        Text("Cairo")
                            .applyLabelStyle(style: .BodyMediumMedium, color: .neutrals500)
                        
                    }
                    
                }
            }
        }
        .frame(height: 300)

    }
}

#Preview {
    VerticalCell()
}
