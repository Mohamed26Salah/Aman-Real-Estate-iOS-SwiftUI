//
//  ViewModifiers.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 13/02/2024.
//

import Foundation
import SwiftUI

extension View {
    func getWidthAndHeight(_ width: Binding<CGFloat>, _ height: Binding<CGFloat>) -> some View {
        modifier(GetWidthAndHeightModifier(width: width, height: height))
    }
}

struct GetWidthAndHeightModifier: ViewModifier {
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    let proxyWidth = proxy.size.width
                    let proxyHeight = proxy.size.height
                    Color.clear
                        .task(id: proxy.size.width) {
                            $width.wrappedValue = max(proxyWidth, 0)
                        }
                        .task(id: proxy.size.height) {
                            $height.wrappedValue = max(proxyHeight, 0)
                        }
                }
            )
    }
}
