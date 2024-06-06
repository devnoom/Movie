//
//  ContentView.swift
//  Movie
//
//  Created by MacBook Air on 05.06.24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State var selectedTab = 0
    @State private var showProfilePage = false
    @State private var showNotification = false
    @State private var showSearchBar = false
    @State private var searchText = ""
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.black.opacity(1).edgesIgnoringSafeArea(.all)
            
            if showProfilePage {
                ProfilePage(showProfilePage: $showProfilePage)
            } else {
                TabView(selection: $selectedTab) {
                    HomePage(searchText: $searchText)
                        .tabItem {
                            Image(systemName: "house")
                            Text("მთავარი")
                        }
                        .tag(0)
                    MoviePage()
                        .tabItem {
                            Image(systemName: "movieclapper")
                            Text("ფილმები")
                        }
                        .tag(1)
                    CollectionPage()
                        .tabItem {
                            Image(systemName: "tv")
                            Text("სერიალები")
                        }
                        .tag(2)
                    SerialsPage()
                        .tabItem {
                            Image(systemName: "book")
                            Text("კოლექცია")
                        }
                        .tag(3)
                }
                .accentColor(.red)
                .background(Color.black.opacity(0.01))
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
                        if showSearchBar {
                            VStack {
                                
                                TextField("რას ეძებ?", text: $searchText)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .padding()
                                    .foregroundColor(.black)
                                    .transition(.move(edge: .bottom))
                                    .onTapGesture {
                                        showSearchBar = true
                                    }
                                
                                ZStack {
                                    SearchResultsView(searchText: $searchText)
                                    Spacer()
                                }
                                .frame(maxHeight: .infinity)
                                .background(Color.gray.opacity(0.00001))
                                .edgesIgnoringSafeArea(.bottom)
                                .onTapGesture {
                                    withAnimation {
                                        showSearchBar = false
                                        searchText = ""
                                    }
                                }
                            }
                        } else {
                            Image(systemName: "tv")
                                .padding()
                            Spacer()
                            HStack {
                                Button(action: {
                                    withAnimation {
                                        showSearchBar.toggle()
                                    }
                                }) {
                                    Image(systemName: "magnifyingglass")
                                }
                                Button(action: {
                                    withAnimation {
                                        showNotification.toggle()
                                    }
                                }) {
                                    Image(systemName: "bell")
                                }
                                Button(action: {
                                    withAnimation {
                                        showProfilePage = true
                                    }
                                }) {
                                    Image(systemName: "person.circle")
                                }
                            }
                            .padding()
                        }
                    }
                    .background(Color.black.opacity(0.9))
                    .foregroundColor(.white)
                    
                    Spacer()
                    
                    if showNotification {
                        VStack {
                            Text("❤️")
                            Text("Here no any notification")
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding()
                        .onTapGesture {
                            withAnimation {
                                showNotification = false
                            }
                        }
                    }
                }
            }
        }
    }
}

