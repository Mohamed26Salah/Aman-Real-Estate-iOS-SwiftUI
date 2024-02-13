//
//  HorizontalCell.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 13/02/2024.
//

import SwiftUI

struct HorizontalCell: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.blue400)
                .frame(height: 120)
            ParallelogramShape()
                .fill(Color.orange)
                .frame(width: 180)
                .offset(x: 50)
            //                .position(x: 300, y: 100)
            HStack {
                VStack {
                    ZStack(alignment: .center) {
                        Text("Dream Home \nFor Sale")
                            .applyLabelStyle(style: .Heading4, color: .red)
                            .scaleEffect(CGSize(width: 1.07, height: 1.07))
                        Text("Dream Home \nFor Sale")
                            .applyLabelStyle(style: .Heading4, color: .white)
                    }
                    ZStack {
                        ParallelogramShape()
                            .foregroundStyle(.red)
                            .frame(height: 20)
                        Text("$250, 000")
                            .applyLabelStyle(style: .Heading5, color: .white)
                    }
                    
                }
                GeometryReader { geometry in
                    ZStack {
                        ParallelogramShape()
                            .fill(Color.blue)
                            .frame(width: geometry.size.width * 0.8, height: geometry.size.height)
                        
                        Image(.firstHouseOnBoarding)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width * 0.8, height: geometry.size.height)
                            .clipShape(ParallelogramShape())
                            .overlay(ParallelogramShape().stroke(Color.white, lineWidth: 2))
                            .shadow(radius: 5)
                    }
                }
                .position(CGPoint(x: 110.0, y: 29.0))
            }
            .padding()
            
        }
//        .frame(height: 120)
    }
}
struct ParallelogramShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX + 20, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX - 20, y: rect.minY))
        
        
        
        path.closeSubpath()
        return path
    }
}
#Preview {
    HorizontalCell()
}
