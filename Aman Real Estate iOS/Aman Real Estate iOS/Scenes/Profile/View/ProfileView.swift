//
//  ProfileVIew.swift
//  Aman Real Estate iOS
//
//  Created by Mohamed Salah on 26/12/2023.
//

import SwiftUI
enum ProfileSelectedTap: String {
    case RecentView
    case HistoryCall
}
struct ProfileView: View {
    @State var selectedTap: ProfileSelectedTap = .RecentView
    @State private var selectionRectangleLocation: CGFloat = 0
    @State private var tabPositions: [CGFloat] = []
    @EnvironmentObject private var sessionManager: SessionManager
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Your Are Logged In")
                Button(action: {
                    sessionManager.signOut()
                }, label: {
                    Text("LogOut")
                })
                HStack {
                    Group {
                        Text("Profile")
                            .applyLabelStyle(style: .Heading3, color: .neutrals900)
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "gearshape")
                                .resizable()
                                .tint(.neutrals900)
                                .frame(width: 20, height: 20)
                        })
                    }
                    .padding()
                }
                Divider()
                Image(SystemDesign.AppImages.FirstHouseOnBoarding.name)
                    .resizable()
                    .clipped()
                    .frame(width: 120, height: 120)
                    .clipShape(.circle)
                Text(sessionManager.currentUser?.email ?? "...")
                    .applyLabelStyle(style: .Heading4, color: .neutrals900)
                Text("Surabaya, Indonisa")
                    .applyLabelStyle(style: .BodyMediumRegular, color: .neutrals600)
                Button(action: {
                    // Action for button
                    print("Button tapped!")
                }) {
                    Text("Edit Profile")
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .inset(by: 0.5)
                                .stroke(.neutrals300, lineWidth: 1)
                        )
                }
                HStack(spacing: 0) {
                    Spacer()
                    tabItem(for: .RecentView, totalWidth: geometry.size.width)
                    Spacer()
                    tabItem(for: .HistoryCall, totalWidth: geometry.size.width)
                    Spacer()
                }
                .padding(.top, 24)
                ZStack {
                    Rectangle()
                        .frame(width: nil, height: 3)
                        .foregroundStyle(.neutrals200)
                    Rectangle()
                        .frame(width: 60, height: 3)
                        .foregroundStyle(.blue500)
                        .cornerRadius(8, corners: .allCorners)
                        .offset(x: selectionRectangleLocation, y: 0)
                }
            }
            .onAppear {
                DispatchQueue.main.async {
                    self.selectionRectangleLocation = calculateOffset(for: .RecentView, totalWidth: geometry.size.width)
                }
            }

        }
    }
    @ViewBuilder
    private func tabItem(for choice: ProfileSelectedTap, totalWidth: CGFloat) -> some View {
        Text(choice.rawValue)
            .applyLabelStyle(style: .BodyMediumSemiBold, color: selectedTap == choice ? .blue500 : .neutrals600)
            .onTapGesture {
                withAnimation {
                    selectedTap = choice
                    selectionRectangleLocation = calculateOffset(for: choice, totalWidth: totalWidth)
                }
            }
    }
    private func calculateOffset(for choice: ProfileSelectedTap, totalWidth: CGFloat) -> CGFloat {
        let offsetValue = totalWidth / CGFloat(5) - 1.2 // 5 because of two taps and 3 spacer
        switch choice {
        case .RecentView:
            return -offsetValue
        case .HistoryCall:
            return offsetValue
        }
    }
}

//#Preview {
//    ProfileView()
//}
