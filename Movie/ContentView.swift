//
//  ContentView.swift
//  Movie
//
//  Created by MacBook Air on 05.06.24.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab = 0
    @State private var showProfilePage = false
    @State private var showNotification = false
    @State private var showSearchBar = false
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            if showProfilePage {
                ProfilePage(showProfilePage: $showProfilePage)
            } else {
                ZStack {
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
                        Text("gia")
                            .tabItem {
                                Image(systemName: "tv")
                                Text("სერიალები")
                            }
                            .tag(2)
                        Text("leo")
                            .tabItem {
                                Image(systemName: "book")
                                Text("კოლექცია")
                            }
                            .tag(3)
                    }
                    .background(Color.red)
                    .accentColor(.red)
                    
                    VStack {
                        HStack {
                            if showSearchBar {
                                TextField("რას ეძებ?", text: $searchText)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding()
                                    .background(Color.white)
                                    .foregroundColor(.red)
                                    .transition(.move(edge: .top))
                            } else {
                                Image(systemName: "tv")
                                    .padding()
                                Spacer()
                                HStack {
                                    Button(action: {
                                        withAnimation {
                                            showSearchBar.toggle()
                                            if !showSearchBar {
                                                searchText = ""
                                            }
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
                            .transition(.move(edge: .top))
                            .onTapGesture {
                                withAnimation {
                                    showNotification = false
                                }
                            }
                        }
                    }
                    
                    if showSearchBar {
                        Color.black.opacity(0.5)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                withAnimation {
                                    showSearchBar = false
                                    searchText = ""
                                }
                            }
                    }
                }
                .onTapGesture {
                    if showNotification {
                        withAnimation {
                            showNotification = false
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
