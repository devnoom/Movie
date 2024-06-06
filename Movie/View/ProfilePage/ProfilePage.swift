//
//  ProfilePage.swift
//  Movie
//
//  Created by MacBook Air on 05.06.24.
//

import SwiftUI

struct ProfilePage: View {
    // MARK: - Properties
    @Binding var showProfilePage: Bool
    // MARK: - Body
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation {
                        showProfilePage = false
                    }
                }) {
                    HStack {
                        Image(systemName: "arrow.left")
                        Text("Back")
                    }
                }
                .padding()
                Spacer()
            }
            Spacer()
            Text("Profile Page")
                .font(.largeTitle)
            Spacer()
        }
    }
}
