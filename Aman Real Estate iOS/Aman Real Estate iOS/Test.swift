//
//  Test.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 12/02/2024.
//

import SwiftUI
import MapKit

struct Test: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<1000) { index in
                    Text("print\(index)")
                        .onAppear(perform: {
                            print("print\(index)")
                        })
                }
            }
        }
    }
}

#Preview {
    Test()
}
